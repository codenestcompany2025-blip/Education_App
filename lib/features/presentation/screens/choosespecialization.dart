import 'package:eduaction_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../widgets/buttons.dart';
import '../widgets/customradiooptions.dart';

class Choosespecialization extends StatefulWidget {
  const Choosespecialization({super.key});

  @override
  State<Choosespecialization> createState() => _ChoosespecializationState();
}

class _ChoosespecializationState extends State<Choosespecialization> {
  String _selectedSection = 'علمي';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("اختر الفرع"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            CustomRadioOption(
              title: 'علمي',
              iconPath: 'assets/images/choosespeclization/scientific.png',
              value: 'علمي',
              groupValue: _selectedSection,
              onChanged: (val) {
                setState(() => _selectedSection = val!);
              },
            ),
            CustomRadioOption(
              title: 'أدبي',
              iconPath: 'assets/images/choosespeclization/literary.png',
              value: 'أدبي',
              groupValue: _selectedSection,
              onChanged: (val) {
                setState(() => _selectedSection = val!);
              },
            ),
            CustomRadioOption(
              title: 'تجاري',
              iconPath: 'assets/images/choosespeclization/buisnes.png',
              value: 'تجاري',
              groupValue: _selectedSection,
              onChanged: (val) {
                setState(() => _selectedSection = val!);
              },
            ),
            CustomRadioOption(
              title: 'شرعي',
              iconPath: 'assets/images/choosespeclization/legitimate.png',
              value: 'شرعي',
              groupValue: _selectedSection,
              onChanged: (val) {
                setState(() => _selectedSection = val!);
              },
            ),SizedBox(height: 50,),
            CustomButton(
              text: 'تاكيد',
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.homePage);
              },
              backgr: blueColor,
              color: whiteColor,
              width: 343,
              borderRadius: 8,
            ),
          ],
        ),
      ),
    );
  }
}
