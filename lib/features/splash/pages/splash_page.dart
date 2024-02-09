import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weaver/core/constants/colors.dart';
import 'package:weaver/core/constants/images.dart';
import 'package:weaver/core/widgets/PoImage.dart';
import 'package:weaver/features/pomo/controllers/pomo_cubit.dart';
import 'package:weaver/features/pomo/pages/pomo_page.dart';
import 'package:weaver/features/splash/controllers/splash_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashCompleted) {
          context.read<PomoCubit>().settings = state.settings;
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.red50,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pomo',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: AppColors.red900,
                      fontWeight: FontWeight.w800,
                    ),
              ),
              const SizedBox(height: 16),
              const PoImage(Images.logo, width: 128, height: 128),
              const SizedBox(height: 32),
              const CircularProgressIndicator(color: AppColors.red900),
            ],
          ),
        ),
      ),
    );
  }
}
