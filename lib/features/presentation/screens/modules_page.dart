import 'package:eduaction_app/features/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../widgets/customsearchbar.dart';
import '../widgets/customsectiontitle.dart';
import '../widgets/customunitbutton.dart';

class ModulesPage extends StatefulWidget {
  final String teacherName;
  final String imagePath;

  const ModulesPage({super.key, required this.teacherName, required this.imagePath});

  @override
  State<ModulesPage> createState() => _ModulesPageState();
}

class _ModulesPageState extends State<ModulesPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true, backgroundColor: Colors.white, elevation: 0),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(radius: 18, backgroundImage: AssetImage(widget.imagePath)),
                const SizedBox(width: 10),
                customTextField(text: "أ.${widget.teacherName}", size: 16, color: Colors.black),
              ],
            ),

            const SizedBox(height: 20),

            CustomSearchBar(controller: _searchController, onFilterTap: () {}),
            SectionTitle(subject: 'الرياضيات', semester: 'الفصل الدراسي الأول'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  UnitButton(text: 'الوحدة الأولى', onPressed: () {}),
                  UnitButton(text: 'الوحدة الثانية', onPressed: () {}),
                  UnitButton(text: 'الوحدة الثالثة', onPressed: () {}),
                  UnitButton(text: 'الوحدة الرابعة', onPressed: () {}),
                ],
              ),
            ),

            SectionTitle(subject: 'الرياضيات', semester: 'الفصل الدراسي الثاني'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  UnitButton(text: 'الوحدة الخامسة', onPressed: () {}),
                  UnitButton(text: 'الوحدة السادسة', onPressed: () {}),
                  UnitButton(text: 'الوحدة السابعة', onPressed: () {}),
                  UnitButton(text: 'الوحدة الثامنة', onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
