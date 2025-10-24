import 'package:flutter/material.dart';
import 'package:eduaction_app/core/constants/colors.dart';
import 'package:eduaction_app/features/presentation/widgets/custom_textfield.dart';
import '../widgets/custom_unit_info_card.dart';
import '../widgets/lesson_card.dart';
import '../widgets/test_card.dart';

class LessonAndTestsPage extends StatefulWidget {
  final String subjectName;
  final String unitName;

  const LessonAndTestsPage({
    super.key,
    required this.subjectName,
    required this.unitName,
  });

  @override
  State<LessonAndTestsPage> createState() => _LessonAndTestsPageState();
}

class _LessonAndTestsPageState extends State<LessonAndTestsPage> {
  bool showLessons = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: customTextField(
          text: 'مادة ${widget.subjectName} / ${widget.unitName}',
          size: 16,
          color: AppColors.blueColor,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UnitInfoCard(
              lessonsCount: 5,
              testsCount: 5,
              duration: 'غير محددة المدة',
            ),
            const SizedBox(height: 12),
            Container(
              height: 45,
              color: Colors.white,
              child: Row(
                children: [
                  _buildTabButton("الدروس", true),
                  const SizedBox(width: 25),
                  _buildTabButton("الاختبارات", false),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                // 🔹 الخط الأول
                const Expanded(
                  child: Divider(
                    color: Colors.black,
                    thickness: 1,
                    endIndent: 10,
                  ),
                ),

                // 🔹 العنوان مع الأيقونة
                Row(
                  children: [
                    const Icon(Icons.edit_note, size: 30, color: Colors.black),
                    const SizedBox(width: 6),
                    customTextField(
                      text: 'دروس الوحدة الاولى',
                      size: 15,
                      color: Colors.black,
                    ),

                  ],
                ),
                const Expanded(
                  child: Divider(color: Colors.black, thickness: 1, indent: 10),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (showLessons) _buildLessonsList() else _buildTestsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String text, bool isLessons) {
    final bool isActive =
        (showLessons && isLessons) || (!showLessons && !isLessons);

    return GestureDetector(
      onTap: () {
        setState(() {
          showLessons = isLessons;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customTextField(
            text: text,
            color: isActive ? AppColors.blueColor : Colors.grey,
            size: 15,
          ),
          const SizedBox(height: 5),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 2,
            width: 40,
            color: isActive ? AppColors.blueColor : Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget _buildLessonsList() {
    return Column(
      children: const [
        LessonCard(
          title: 'الدرس الأول: اشتقاق وتكامل',
          unlocked: true,
          completed: true,
        ),
        LessonCard(
          title: 'الدرس الثاني: الاشتقاق',
          unlocked: true,
          completed: false,
        ),
        LessonCard(title: 'الدرس الثالث: المعادلات', unlocked: false),
        LessonCard(title: 'الدرس الرابع: التكامل', unlocked: false),
      ],
    );
  }

  // 🔹 محتوى تبويب الاختبارات
  Widget _buildTestsList() {
    return Column(
      children: const [
        TestCard(title: 'الاختبار الأول', unlocked: true, passed: true),
        TestCard(title: 'الاختبار الثاني', unlocked: true, passed: false),
        TestCard(title: 'الاختبار الثالث', unlocked: false),
        TestCard(title: 'الاختبار الرابع', unlocked: false),
      ],
    );
  }
}
