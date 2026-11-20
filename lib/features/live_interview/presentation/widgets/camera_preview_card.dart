import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/theme/app_theme.dart';

class CameraPreviewCard extends StatefulWidget {
  final bool isCameraOn;
  final bool isFrontCamera;
  final bool isMuted;
  final VoidCallback onToggleCamera;
  final VoidCallback onSwitchCamera;
  final VoidCallback onToggleMute;
  final VoidCallback onEndSession;

  const CameraPreviewCard({
    super.key,
    required this.isCameraOn,
    required this.isFrontCamera,
    required this.isMuted,
    required this.onToggleCamera,
    required this.onSwitchCamera,
    required this.onToggleMute,
    required this.onEndSession,
  });

  @override
  State<CameraPreviewCard> createState() => _CameraPreviewCardState();
}

class _CameraPreviewCardState extends State<CameraPreviewCard> {
  CameraController? _cameraController;
  List<CameraDescription> _cameras = [];
  bool _isInit = false;
  String? _initError;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void didUpdateWidget(covariant CameraPreviewCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isFrontCamera != widget.isFrontCamera) {
      _selectCamera(widget.isFrontCamera);
    }
  }

  Future<void> _initializeCamera() async {
    try {
      if (!kIsWeb) {
        final status = await Permission.camera.request();
        if (!status.isGranted) {
          setState(() => _initError = 'Camera permission not granted');
          return;
        }
      }

      _cameras = await availableCameras();
      if (_cameras.isEmpty) {
        setState(() => _initError = 'No cameras found on device');
        return;
      }

      await _selectCamera(widget.isFrontCamera);
    } catch (e) {
      setState(() => _initError = 'Camera error: $e');
    }
  }

  Future<void> _selectCamera(bool useFront) async {
    if (_cameras.isEmpty) return;

    final targetDirection =
        useFront ? CameraLensDirection.front : CameraLensDirection.back;

    CameraDescription selectedCam = _cameras.firstWhere(
      (c) => c.lensDirection == targetDirection,
      orElse: () => _cameras.first,
    );

    if (_cameraController != null) {
      await _cameraController!.dispose();
    }

    _cameraController = CameraController(
      selectedCam,
      ResolutionPreset.medium,
      enableAudio: false, // Audio handled by STT
    );

    try {
      await _cameraController!.initialize();
      if (mounted) {
        setState(() {
          _isInit = true;
          _initError = null;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _initError = 'Failed to initialize camera: $e');
      }
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: const Color(0xFF131C31),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF334155), width: 1.5),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Camera Preview or Fallback Avatar
          if (widget.isCameraOn &&
              _isInit &&
              _cameraController != null &&
              _cameraController!.value.isInitialized)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _cameraController!.value.previewSize?.height ?? 1,
                  height: _cameraController!.value.previewSize?.width ?? 1,
                  child: CameraPreview(_cameraController!),
                ),
              ),
            )
          else
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
                    child: Icon(
                      widget.isCameraOn ? Icons.person_rounded : Icons.videocam_off_rounded,
                      size: 44,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.isCameraOn
                        ? (_initError ?? 'Initializing Camera...')
                        : 'Camera Feed Off',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),

          // Candidate Name Badge
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.65),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Icon(Icons.person, color: Colors.white, size: 14),
                  SizedBox(width: 4),
                  Text(
                    'Candidate Video Stream',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Controls Bar (Overlay at bottom)
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.75),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Mute / Unmute
                  IconButton(
                    icon: Icon(
                      widget.isMuted ? Icons.mic_off_rounded : Icons.mic_rounded,
                      color: widget.isMuted ? AppTheme.errorColor : Colors.white,
                    ),
                    onPressed: widget.onToggleMute,
                    tooltip: widget.isMuted ? 'Unmute' : 'Mute',
                  ),

                  // Toggle Video On/Off
                  IconButton(
                    icon: Icon(
                      widget.isCameraOn ? Icons.videocam_rounded : Icons.videocam_off_rounded,
                      color: widget.isCameraOn ? Colors.white : AppTheme.errorColor,
                    ),
                    onPressed: widget.onToggleCamera,
                    tooltip: widget.isCameraOn ? 'Turn Camera Off' : 'Turn Camera On',
                  ),

                  // Switch Front/Back Camera
                  IconButton(
                    icon: const Icon(Icons.flip_camera_ios_rounded, color: Colors.white),
                    onPressed: widget.onSwitchCamera,
                    tooltip: 'Switch Camera',
                  ),

                  // End Session
                  IconButton(
                    icon: const Icon(Icons.call_end_rounded, color: AppTheme.errorColor),
                    onPressed: widget.onEndSession,
                    tooltip: 'End Interview Session',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
