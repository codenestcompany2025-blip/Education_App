// import 'package:flutter/material.dart';
//
// import '../../../core/routes/app_routes.dart';
// import '../widgets/buttons.dart';
//
//
// class Detailesofteacher extends StatelessWidget {
//   final String name;
//   final String imagePath;
//
//   const Detailesofteacher({
//     super.key,
//     required this.name,
//     required this.imagePath,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(automaticallyImplyLeading: true),
//       body:
//       Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 40,
//               backgroundImage: AssetImage(imagePath),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               name,
//               style: const TextStyle(
//                 fontFamily: 'Cairo-Bold',
//                 fontSize: 20,
//                 color: Colors.black,
//               ),
//             ),
//             AppButtons.primaryButton(
//               text: 'انتقل للمادة',
//               onPressed: () {
//                 Navigator.pushNamed(
//                   context,
//                   AppRoutes.modulesPage,
//                   arguments: {
//                     'name': name,
//                     'image': imagePath,
//                   },
//                 );
//               },
//               width: 300,
//               borderRadius: 10,
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:eduaction_app/core/constants/colors.dart';
import 'package:eduaction_app/core/routes/app_routes.dart';
import 'package:eduaction_app/features/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';

import '../widgets/teacherdetailscard.dart';

class Detailesofteacher extends StatelessWidget {
  final String name;
  final String imagePath;

  const Detailesofteacher({
    super.key,
    required this.name,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.whiteColor,
      ),
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              SizedBox(height: 50,),
              // ✅ استخدام المكون TeacherDetailsCard
              TeacherDetailsCard(
                name: name,
                imagePath: imagePath,
                bio: "مدرّس متخصص في المادة ويتمتع بخبرة تعليمية عالية.",
                experience: "5 سنوات من الخبرة في التدريس.",
                email: "teacher@example.com",
                phone: "+970 599 123 456",
                address: "غزة - فلسطين",
              ),

              const SizedBox(height: 40),

              // ✅ زر الانتقال إلى المادة
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AppButtons.primaryButton(
                  text: 'انتقل إلى المادة',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.modulesPage,
                      arguments: {
                        'name': name,
                        'image': imagePath,
                      },
                    );
                  },
                  background: AppColors.blueColor,
                  color: AppColors.whiteColor,
                  width: double.infinity,
                  borderRadius: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
