import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../core/theme/app_colors.dart';

class SummaryGrid extends StatelessWidget {
  final int gymCount;
  final int streak;
  final int totalWorkouts;
  final double weeklyAverage;

  const SummaryGrid({
    super.key,
    required this.gymCount,
    required this.streak,
    required this.totalWorkouts,
    required this.weeklyAverage,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      _SummaryItem(
        icon: LucideIcons.calendar,
        value: '$gymCount',
        title: 'Treinos esta semana',
        subtitle: 'Igual à semana passada',
        iconColor: AppColors.primaryGreen,
      ),
      _SummaryItem(
        icon: LucideIcons.medal,
        value: '$streak',
        title: 'Melhor sequência',
        subtitle: 'Dias consecutivos de treino',
        iconColor: AppColors.primaryOrange,
      ),
      _SummaryItem(
        icon: LucideIcons.target,
        value: '$totalWorkouts',
        title: 'Total de treinos',
        subtitle: 'Desde o primeiro registro',
        iconColor: AppColors.primaryGreen,
      ),
      _SummaryItem(
        icon: LucideIcons.trendingUp,
        value: weeklyAverage.toStringAsFixed(1),
        title: 'Média semanal',
        subtitle: 'Treinos por semana',
        iconColor: AppColors.primaryGreen,
      ),
    ];

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.3,
      children: items.map((item) => _buildCard(item)).toList(),
    );
  }

  Widget _buildCard(_SummaryItem item) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: item.iconColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  item.icon,
                  color: item.iconColor,
                  size: 18,
                ),
              ),
              // Optional: Add a menu icon or something if needed
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                item.subtitle,
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.textSecondary.withOpacity(0.7),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummaryItem {
  final IconData icon;
  final String value;
  final String title;
  final String subtitle;
  final Color iconColor;

  _SummaryItem({
    required this.icon,
    required this.value,
    required this.title,
    required this.subtitle,
    required this.iconColor,
  });
}
