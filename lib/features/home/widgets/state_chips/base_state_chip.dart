import 'package:flutter/material.dart';
import 'package:pomo/core/widgets/PoImage.dart';

class BaseStateChip extends StatelessWidget {
  final String icon;
  final String label;
  final Color color;
  final Color? backgroundColor;
  const BaseStateChip({
    required this.icon,
    required this.label,
    required this.color,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:backgroundColor?? color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: color,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          PoImage(icon, color: color, width: 32, height: 32),
          const SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
