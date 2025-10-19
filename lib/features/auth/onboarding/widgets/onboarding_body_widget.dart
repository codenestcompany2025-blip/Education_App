import 'package:eduaction_app/core/constants/colors.dart';
import 'package:eduaction_app/features/auth/onboarding/manage/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildPageViewWithText(BuildContext context, OnboardingCubit cubit, PageController controller) => SizedBox(
  height: 500,
  child: PageView.builder(
    controller: controller,
    onPageChanged: cubit.goToPage,
    itemCount: cubit.pages.length,
    itemBuilder: (context, index) {
      final pageData = cubit.pages[index];
      return Column(
        children: [
          Expanded(flex: 5, child: SvgPicture.asset(pageData["image"]!, fit: BoxFit.contain)),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: Text(
                    pageData["title"]!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: Text(
                    pageData["desc"]!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black87, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  ),
);
