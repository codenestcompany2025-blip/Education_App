import 'package:eduaction_app/core/constants/colors.dart';
import 'package:eduaction_app/core/routes/app_routes.dart';
import 'package:eduaction_app/features/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manage/onboarding_cubit.dart';
import '../widgets/onboarding_body_widget.dart';
import '../widgets/onboarding_indicator_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  final Duration _pageTransitionDuration = const Duration(milliseconds: 300);
  final Curve _pageTransitionCurve = Curves.easeIn;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: BlocConsumer<OnboardingCubit, OnboardingState>(
        listener: (context, state) {
          if (state is OnboardingCompleted) {
            Navigator.pushReplacementNamed(context, AppRoutes.loginOrRegister);
          }
        },
        builder: (context, state) {
          final cubit = context.read<OnboardingCubit>();
          return _buildOnboardingContent(context, cubit, state.currentPage);
        },
      ),
    );
  }

  Widget _buildOnboardingContent(BuildContext context, OnboardingCubit cubit, int currentPage) => Scaffold(
    body: SafeArea(
      child: Column(
        children: [
          const Spacer(),
          buildPageViewWithText(context, cubit, _pageController),
          buildPageIndicators(cubit, currentPage),
          const Spacer(),
          _buildNavigationButton(cubit, currentPage),
          const Spacer(),
        ],
      ),
    ),
  );

  Widget _buildNavigationButton(OnboardingCubit cubit, int currentPage) {
    final isLastPage = currentPage == cubit.pages.length - 1;
    return Column(
      spacing: 15,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: AppButtons.primaryButton(
            text: isLastPage ? "هيا لنبدأ" : "استمر",
            onPressed: () {
              if (isLastPage) {
                cubit.completeOnboarding();
              } else {
                cubit.nextPage();
                _pageController.nextPage(duration: _pageTransitionDuration, curve: _pageTransitionCurve);
              }
            },
            background: AppColors.blueColor,
            color: AppColors.whiteColor,
            width: double.infinity,
            borderRadius: 12,
          ),
        ),
        isLastPage
            ? SizedBox()
            : InkWell(
                onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.loginOrRegister),
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Text(
                  "تخطي",
                  style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.grayColor, fontSize: 15),
                ),
              ),
      ],
    );
  }
}
