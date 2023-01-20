class BaseStateChip extends StatelessWidget {
  final String icon;
  final String label;
  final Color color;

  const BaseStateChip({
    required this.icon,
    required this.label,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      )
    );
  }
}
