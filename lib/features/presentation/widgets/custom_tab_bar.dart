import 'package:flutter/material.dart';
import 'package:eduaction_app/core/constants/colors.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController controller;

  const CustomTabBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      labelColor: AppColors.blueColor,
      unselectedLabelColor: AppColors.blackColor,
      indicatorColor: AppColors.blueColor,
      indicatorWeight: 3,
      labelStyle: const TextStyle(fontFamily: 'Cairo-Bold', fontSize: 15),
      tabs: const [
        Tab(text: 'الدروس'),
        Tab(text: 'الاختبارات'),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
