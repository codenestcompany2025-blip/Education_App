import 'package:eduaction_app/core/constants/colors.dart';
import 'package:eduaction_app/features/presentation/widgets/coursecategorycard.dart';
import 'package:eduaction_app/features/presentation/widgets/custom_textfield.dart';
import 'package:eduaction_app/features/presentation/widgets/customnavigationbar.dart';
import 'package:flutter/material.dart';

import '../../../core/routes/app_routes.dart';
import '../widgets/lessonprogresscard.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const CircleAvatar(radius: 20, backgroundImage: AssetImage("assets/images/choosespeclization/profile.png")),
            const SizedBox(width: 12),
            Expanded(
              child: customTextField(text: 'Mohammed Al Laham', size: 18, color: Colors.black),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications, color: AppColors.blueColor, size: 28),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/homeandother/introduction.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 30),
            _buildSectionHeader(title: 'الأقسام'),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: const [
                          CourseCategoryCard(
                            imagePath: 'assets/images/homeandother/healthyCourse.png',
                            title: 'الصحة والتغذية',
                            coursesCount: '15',
                          ),
                          SizedBox(width: 16),
                          CourseCategoryCard(
                            imagePath: 'assets/images/homeandother/it.png',
                            title: 'تكنولوجيا المعلومات',
                            coursesCount: '20',
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.sections);
                    },
                    icon: const Icon(Icons.navigate_next, color: AppColors.blueColor, size: 35),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            _buildSectionHeader(title: 'المشاهدات الأخيرة'),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: const [
                  LessonProgressCard(
                    imagePath: 'assets/images/homeandother/finance.png',
                    title: 'المحاسبة المالية',
                    subtitle: 'الدرس الثالث',
                    currentLesson: 6,
                    totalLessons: 10,
                  ),
                  SizedBox(width: 16),
                  LessonProgressCard(
                    imagePath: 'assets/images/homeandother/it.png',
                    title: 'مقدمة بالحاسوب',
                    subtitle: 'الدرس الثاني',
                    currentLesson: 6,
                    totalLessons: 10,
                  ),
                  SizedBox(width: 16),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  customTextField(text: 'ورشات عمل مقترحة', color: AppColors.blueColor, size: 20),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      // TODO: Navigate to all categories
                    },
                    icon: const Icon(Icons.refresh_sharp, color: AppColors.blueColor, size: 35),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/homeandother/conversation.png', // ضع مسار الصورة هنا
                  width: double.infinity, // تاخد عرض الشاشة بالكامل
                  fit: BoxFit.cover, // تملي المساحة بدون تشويه
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }

  Widget _buildSectionHeader({required String title}) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      children: [
        customTextField(text: title, color: AppColors.blueColor, size: 20),
        const Spacer(),
        Container(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.blueColor, width: 1.5)),
          ),
          child: customTextField(text: 'المزيد', color: AppColors.blueColor, size: 15),
        ),
      ],
    ),
  );
}
