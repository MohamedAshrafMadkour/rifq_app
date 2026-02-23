import 'package:flutter/material.dart';
import 'package:sakina_app/core/constants/app_routes.dart';
import 'package:sakina_app/core/constants/keys.dart';
import 'package:sakina_app/core/helper/shared_prefs.dart';
import 'package:sakina_app/features/splash/presentation/view/widgets/custom_circle_container.dart';
import 'package:sakina_app/features/splash/presentation/view/widgets/custom_splash_loading.dart';
import 'package:sakina_app/features/splash/presentation/view/widgets/custom_splash_logo.dart';
import 'package:sakina_app/l10n/app_localizations.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    executeAnimation();
    executeNavigation();
  }

  void executeNavigation() {
    Future.delayed(const Duration(seconds: 4), () {
      final locationNav = SharedPref.getBool(AppKeys.locationNav);
      final locationSkip = SharedPref.getBool(AppKeys.locationSkip);
      final onBoardingNav = SharedPref.getBool(AppKeys.onBoardingNav);
      final onBoardingSkip = SharedPref.getBool(AppKeys.onBoardingSkip);
      if (onBoardingNav || onBoardingSkip) {
        if (locationNav || locationSkip) {
          Navigator.pushNamed(context, AppRoutes.homeView);
        } else {
          Navigator.pushNamed(context, AppRoutes.locationPermissionView);
        }
      } else {
        Navigator.pushNamed(context, AppRoutes.onBoardingView);
      }
    });
  }

  void executeAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _scaleAnimation = Tween(begin: .8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    _slideAnimation = Tween(begin: const Offset(0, .5), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOut),
        );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0D7E5E),
                Color(0xFF062F24),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        const Positioned(
          top: 80,
          left: 30,
          child: CustomCircleContainer(opacity: .08),
        ),
        const Positioned(
          bottom: 120,
          right: 20,
          child: CustomCircleContainer(opacity: .06),
        ),

        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: const CustomSplashLogo(),
                ),
              ),
              const SizedBox(height: 30),
              SlideTransition(
                position: _slideAnimation,
                child: Column(
                  children: [
                    Text(
                      locale.splashViewTitle,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      locale.splashViewSubTitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              CustomSplashLoading(),
            ],
          ),
        ),
      ],
    );
  }
}
