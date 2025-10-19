import 'package:eduaction_app/features/presentation/screens/teachers_of_material.dart';
import 'package:eduaction_app/features/presentation/widgets/cardofmaterial.dart';
import 'package:eduaction_app/features/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class Sections extends StatefulWidget {
  const Sections({super.key});

  @override
  State<Sections> createState() => _SectionsState();
}

class _SectionsState extends State<Sections> {
  final List<Map<String, String>> materials = [
    {'name': 'الكيمياء', 'image': 'assets/images/homeandother/chemistry.png'},
    {'name': 'الرياضيات', 'image': 'assets/images/homeandother/math.png'},
    {'name': 'الفيزياء', 'image': 'assets/images/homeandother/physical.png'},
    {'name': 'الأحياء', 'image': 'assets/images/homeandother/alive.png'},
    {'name': 'تكنولوجيا', 'image': 'assets/images/homeandother/itM.png'},
    {'name': 'اللغة العربية', 'image': 'assets/images/homeandother/arabic.png'},
    {'name': 'الإنجليزية', 'image': 'assets/images/homeandother/english.png'},
    {'name': 'التربية الإسلامية', 'image': 'assets/images/homeandother/islamic.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customTextField(text: 'المواد الدراسية', size: 20),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: materials.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            final material = materials[index];
            return CardOfMaterial(
              imagePath: material['image']!,
              nameMaterial: material['name']!,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TeachersOfMaterial(materialName: material['name']!)),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
