import 'package:flutter/material.dart';
import 'package:eduaction_app/core/constants/colors.dart';
import 'package:eduaction_app/features/presentation/widgets/custom_textfield.dart';
import 'package:eduaction_app/features/presentation/widgets/unit_header_info_card.dart';
import 'package:eduaction_app/features/presentation/widgets/section_header_with_lines.dart';
import 'package:eduaction_app/features/presentation/widgets/lesson_item_card.dart';
import 'package:eduaction_app/features/presentation/widgets/test_item_card.dart';

class UnitContentPage extends StatefulWidget {
  final String subjectName; // مثال: "الرياضيات"
  final String unitName; // مثال: "الوحدة الأولى"
  final String teacherName; // مثال: "أ. سامي أحمد"
  final String imagePath; // صورة المدرّس

  const UnitContentPage({
    super.key,
    required this.subjectName,
    required this.unitName,
    required this.teacherName,
    required this.imagePath,
  });

  @override
  State<UnitContentPage> createState() => _UnitContentPageState();
}

class _UnitContentPageState extends State<UnitContentPage> {
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
          size: 14,
          color: AppColors.blueColor,
        ),
      ),

      body: ScrollbarTheme(
        data: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(AppColors.blueColor), // اللون الأزرق
          thickness: WidgetStateProperty.all(6),
          radius: const Radius.circular(12),
        ),
        child: Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(

            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UnitHeaderInfoCard(
                  lessonsCount: 5,
                  testsCount: 5,
                  durationText: 'غير محددة المدة',
                ),

                const SizedBox(height: 12),

                // التاب بار
                _buildTabs(),

                const SizedBox(height: 16),

                SectionHeaderWithLines(
                  icon: Icons.edit_note,
                  title: showLessons ?'دروس ${widget.unitName}':'اختبارات ${widget.unitName}',
                ),

                const SizedBox(height: 12),

                // حسب التاب
                showLessons ? _buildLessonsList() : _buildTestsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      height: 45,
      color: AppColors.whiteColor,
      child: Row(
        children: [
          _buildTabButton("الدروس", true),
          const SizedBox(width: 25),
          _buildTabButton("الاختبارات", false),
        ],
      ),
    );
  }

  Widget _buildTabButton(String text, bool isLessonsTab) {
    final bool isActive =
        (showLessons && isLessonsTab) || (!showLessons && !isLessonsTab);

    return GestureDetector(
      onTap: () {
        setState(() {
          showLessons = isLessonsTab;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customTextField(
            text: text,
            color: isActive ? AppColors.blueColor : AppColors.blackColor,
            size: 15,
          ),
          const SizedBox(height: 5),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
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
        LessonItemCard(
          lessonTitle: 'الدرس الأول / تفاضل وتكامل',
          isOpen: true,
          isDone: true,
          statusText: 'متاح',
        ),
        LessonItemCard(
          lessonTitle: 'الدرس الثاني / تفاضل وتكامل',
          isOpen: false,
          isDone: false,
          statusText: 'مغلق',
        ),
        LessonItemCard(
          lessonTitle: 'الدرس الثالث / تفاضل وتكامل',
          isOpen: false,
          isDone: false,
          statusText: 'مغلق',
        ),
        LessonItemCard(
          lessonTitle: 'الدرس الرابع / تفاضل وتكامل',
          isOpen: false,
          isDone: false,
          statusText: 'مغلق',
        ),
        LessonItemCard(
          lessonTitle: 'الدرس الخامس / تفاضل وتكامل',
          isOpen: false,
          isDone: false,
          statusText: 'متاح',
        ),
        LessonItemCard(
          lessonTitle: 'الدرس السادس / تفاضل وتكامل',
          isOpen: false,
          isDone: false,
          statusText: 'مغلق',
        ),
        LessonItemCard(
          lessonTitle: 'الدرس السابع / تفاضل وتكامل',
          isOpen: false,
          isDone: false,
          statusText: 'مغلق',
        ),
        LessonItemCard(
          lessonTitle: 'الدرس الثامن / تفاضل وتكامل',
          isOpen: false,
          isDone: false,
          statusText: 'مغلق',
        ),
      ],
    );
  }

  Widget _buildTestsList() {
    return Column(
      children: const [
        TestItemCard(
          statusText: 'منجز',
          title: 'الاختبار الأول',
          isOpen: true,
          passed: true,
        ),
        TestItemCard(
          statusText: 'جاهز',
          title: 'الاختبار الثاني',
          isOpen: true,
          passed: false,
        ),
        TestItemCard(
          statusText: 'مغلق',
          title: 'الاختبار الثالث',
          isOpen: false,
          passed: false,
        ),
      ],
    );
  }
}
