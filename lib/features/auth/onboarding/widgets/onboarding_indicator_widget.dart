import 'package:eduaction_app/core/constants/colors.dart';
import 'package:eduaction_app/features/auth/onboarding/manage/onboarding_cubit.dart';
import 'package:flutter/cupertino.dart';

Widget buildPageIndicators(OnboardingCubit cubit, int currentPage) => Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: List.generate(
    cubit.pages.length,
    (index) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.5),
      child: Container(
        width: 9,
        height: 9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: currentPage == index ? AppColors.blueColor : AppColors.grayColor,
        ),
      ),
    ),
  ),
);
