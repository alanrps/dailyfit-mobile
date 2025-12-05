import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class WeeklyTracker extends StatelessWidget {
  final bool gymDone;
  final bool creatineDone;
  final bool wheyDone;

  const WeeklyTracker({
    super.key,
    required this.gymDone,
    required this.creatineDone,
    required this.wheyDone,
  });

  @override
  Widget build(BuildContext context) {
    final days = ['Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom', 'Seg'];
    // Assuming today is the last day for demo purposes, or we can find the current weekday.
    // Let's just highlight the last column as "Today" for simplicity in this demo,
    // or map DateTime.weekday.
    // The image shows 7 days. Let's assume the list is fixed for now.

    // For this demo, we will light up the LAST column (Seg) based on the inputs,
    // simulating that today is Monday (Seg).

    final habits = [
      {'name': 'Academia', 'color': AppColors.primaryGreen, 'isDone': gymDone},
      {
        'name': 'Creatina',
        'color': AppColors.primaryGreen,
        'isDone': creatineDone
      },
      {'name': 'Whey', 'color': AppColors.primaryOrange, 'isDone': wheyDone},
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          // Header Row (Days)
          Row(
            children: [
              const SizedBox(width: 80),
              ...days.map((day) => Expanded(
                    child: Text(
                      day,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  )),
            ],
          ),
          const SizedBox(height: 12),

          // Rows
          ...habits.map((habit) {
            final color = habit['color'] as Color;
            final isDone = habit['isDone'] as bool;

            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  ...List.generate(7, (index) {
                    // Highlight only the last column (index 6) if isDone is true
                    final isActive = index == 6 && isDone;

                    return Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        height: 24,
                        decoration: BoxDecoration(
                          color: isActive ? color : Colors.grey[100],
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            );
          }).toList(),

          const SizedBox(height: 12),

          // Legend
          Row(
            children: [
              _buildLegendItem('Academia', AppColors.primaryGreen),
              const SizedBox(width: 16),
              _buildLegendItem('Creatina', AppColors.primaryGreen),
              const SizedBox(width: 16),
              _buildLegendItem('Whey', AppColors.primaryOrange),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
