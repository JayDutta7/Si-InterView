import 'package:flutter/material.dart';

import 'package:mobileprep_ai/features/analytics/presentation/screens/score_analysis_screen.dart';
import 'package:mobileprep_ai/features/live_interview/presentation/screens/live_interview_screen.dart';
import 'package:mobileprep_ai/features/performance/presentation/screens/performance_dashboard_screen.dart';
import 'package:mobileprep_ai/features/quiz/presentation/screens/quiz_setup_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const QuizSetupScreen(),
    const LiveInterviewScreen(),
    const PerformanceDashboardScreen(),
    const ScoreAnalysisScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() => _currentIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.quiz_outlined),
            selectedIcon: Icon(Icons.quiz_rounded),
            label: 'MCQ Practice',
          ),
          NavigationDestination(
            icon: Icon(Icons.videocam_outlined),
            selectedIcon: Icon(Icons.videocam_rounded),
            label: '1-to-1 Live',
          ),
          NavigationDestination(
            icon: Icon(Icons.speed_outlined),
            selectedIcon: Icon(Icons.speed_rounded),
            label: 'Performance',
          ),
          NavigationDestination(
            icon: Icon(Icons.history_rounded),
            selectedIcon: Icon(Icons.analytics_rounded),
            label: 'History & Review',
          ),
        ],
      ),
    );
  }
}
