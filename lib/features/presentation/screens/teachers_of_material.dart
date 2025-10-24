import 'package:eduaction_app/features/presentation/widgets/buttons.dart';
import 'package:eduaction_app/features/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../../../core/routes/app_routes.dart';
import '../widgets/teacheroptioncard.dart';

class TeachersOfMaterial extends StatefulWidget {
  final String materialName;

  const TeachersOfMaterial({super.key, required this.materialName});

  @override
  State<TeachersOfMaterial> createState() => _TeachersOfMaterialState();
}

class _TeachersOfMaterialState extends State<TeachersOfMaterial> with SingleTickerProviderStateMixin {
  int selectedIndex = -1;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final List<Map<String, String>> teachers = [
    {'name': 'سامي أحمد', 'image': 'assets/images/choosespeclization/profile.png'},
    {'name': 'محمود رامي', 'image': 'assets/images/choosespeclization/profile.png'},
    {'name': 'عبد الكريم رامي', 'image': 'assets/images/choosespeclization/profile.png'},
    {'name': 'أحمد بسام', 'image': 'assets/images/choosespeclization/profile.png'},
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSelectTeacher(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (!_controller.isCompleted) {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customTextField(text: 'المدرسين لمادة ${widget.materialName}', size: 18),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 10),

            ...List.generate(
              teachers.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TeacherOptionCard(
                  name: teachers[index]['name']!,
                  imagePath: teachers[index]['image']!,
                  isSelected: selectedIndex == index,
                  onTap: () => _onSelectTeacher(index),
                ),
              ),
            ),
            const SizedBox(height: 25),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(position: _slideAnimation, child: child),
                );
              },
              child: AppButtons.primaryButton(
                text: 'تأكيد',
                onPressed: selectedIndex != -1
                    ? () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.detailsOfTeacher,
                    arguments: {
                      'name': teachers[selectedIndex]['name'],
                      'image': teachers[selectedIndex]['image'],
                    },
                  );
                }
                    : () {}, // تقدر تخليها null إذا بدك الزر يتعطل
                width: double.infinity,
                borderRadius: 8,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
