import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/core/constants/images.dart';
import 'package:pomo/core/widgets/PoImage.dart';
import 'package:pomo/features/home/controllers/pomo_cubit.dart';

class ControlButtons extends StatelessWidget {
  final Color mainColor;
  final Color secondaryColor;
  final Color iconColor;

  const ControlButtons({
    required this.mainColor,
    required this.secondaryColor,
    required this.iconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pomoCubit = context.read<PomoCubit>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _ControlButton(
          icon: Images.more,
          color: secondaryColor,
          iconColor: iconColor,
          width: 80,
          height: 80,
          onPressed: () {},
        ),
        const SizedBox(width: 16),
        BlocBuilder<PomoCubit, PomoState>(
          builder: (context, state) {
            return _ControlButton(
              icon: pomoCubit.isPlaying ? Images.pause : Images.play,
              color: mainColor,
              iconColor: iconColor,
              width: 128,
              height: 96,
              onPressed: () => pomoCubit.next(),
            );
          },
        ),
        const SizedBox(width: 16),
        _ControlButton(
          icon: Images.skip,
          color: secondaryColor,
          iconColor: iconColor,
          width: 80,
          height: 80,
          onPressed: () {},
        ),
      ],
    );
  }
}

class _ControlButton extends StatelessWidget {
  final Color color;
  final String icon;
  final Color iconColor;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const _ControlButton({
    required this.color,
    required this.icon,
    required this.iconColor,
    required this.width,
    required this.height,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.all(8),
          child: Center(
            child: PoImage(
              icon,
              color: iconColor,
              width: 32,
              height: 32,
            ),
          ),
        ),
      ),
    );
  }
}
