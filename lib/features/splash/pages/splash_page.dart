import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/core/constants/colors.dart';
import 'package:pomo/core/constants/images.dart';
import 'package:pomo/core/widgets/PoImage.dart';
import 'package:pomo/features/home/controllers/pomo_cubit.dart';
import 'package:pomo/features/home/pages/home_page.dart';
import 'package:pomo/features/splash/controllers/splash_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashCompleted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => BlocProvider<PomoCubit>(
                create: (context) => PomoCubit(state.settings),
                child: const HomePage(),
              ),
            ),
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
                style: Theme.of(context)
                    .textTheme
                    .displayLarge
                    ?.copyWith(color: AppColors.red900),
              ),
              const SizedBox(height: 16),
              const PoImage(Images.logo),
              const SizedBox(height: 32),
              const CircularProgressIndicator(color: AppColors.red900),
            ],
          ),
        ),
      ),
    );
  }
}
