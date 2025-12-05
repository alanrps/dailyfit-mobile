import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/stat_card.dart';
import '../widgets/action_button.dart';
import '../widgets/weekly_tracker.dart';
import '../widgets/summary_grid.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _gymDone = false;
  bool _creatineDone = false;
  bool _wheyDone = false;

  // Stats
  int _streak = 0;
  int _gymCount = 0;
  int _consistency = 0;

  void _toggleGym() {
    setState(() {
      _gymDone = !_gymDone;
      if (_gymDone) {
        _streak++;
        _gymCount++;
      } else {
        _streak--;
        _gymCount--;
      }
    });
  }

  void _toggleCreatine() {
    setState(() {
      _creatineDone = !_creatineDone;
      if (_creatineDone) {
        _consistency++;
      } else {
        _consistency--;
      }
    });
  }

  void _toggleWhey() {
    setState(() {
      _wheyDone = !_wheyDone;
      if (_wheyDone) {
        _consistency++;
      } else {
        _consistency--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryGreen,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fitness Tracker',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              'Acompanhe sua evolução diária',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Stats Row
            Row(
              children: [
                StatCard(
                  title: 'Sequência Atual',
                  value: '$_streak',
                  subtitle: 'dias consecutivos',
                  icon: LucideIcons.flame,
                  isPrimary: true,
                ),
                StatCard(
                  title: 'Academia este mês',
                  value: '$_gymCount',
                  subtitle: 'treinos realizados',
                  icon: LucideIcons.dumbbell,
                ),
                StatCard(
                  title: 'Consistência',
                  value: '$_consistency',
                  subtitle: 'doses de suplementos',
                  icon: LucideIcons.trendingUp,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Today's Actions
            const Row(
              children: [
                Icon(LucideIcons.calendar, size: 20),
                SizedBox(width: 8),
                Text(
                  'Hoje',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Action Buttons
            Row(
              children: [
                ActionButton(
                  label: 'Academia',
                  subLabel: 'Fui à Academia',
                  icon: LucideIcons.dumbbell,
                  isDone: _gymDone,
                  onTap: _toggleGym,
                ),
                ActionButton(
                  label: 'Creatina',
                  subLabel: 'Tomei Creatina',
                  icon: LucideIcons.droplet,
                  isDone: _creatineDone,
                  onTap: _toggleCreatine,
                ),
                ActionButton(
                  label: 'Whey',
                  subLabel: 'Tomei Whey',
                  icon: LucideIcons.milk,
                  isDone: _wheyDone,
                  onTap: _toggleWhey,
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Weekly Tracker
            const Text(
              'Semana Atual',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            WeeklyTracker(
              gymDone: _gymDone,
              creatineDone: _creatineDone,
              wheyDone: _wheyDone,
            ),

            const SizedBox(height: 24),

            // Bottom Stats
            const Row(
              children: [
                Icon(LucideIcons.barChart2, size: 20),
                SizedBox(width: 8),
                Text(
                  'Gráficos e Monitores',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SummaryGrid(
              gymCount: _gymCount,
              streak: _streak,
              totalWorkouts: _gymCount,
              weeklyAverage: _gymCount / 1.0,
            ),
          ],
        ),
      ),
    );
  }
}
