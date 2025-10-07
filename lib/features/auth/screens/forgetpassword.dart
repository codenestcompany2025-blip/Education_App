import 'package:eduaction_app/features/auth/screens/verifycode.dart';
import 'package:eduaction_app/features/presentation/widgets/custom_textfield.dart';
import 'package:eduaction_app/features/presentation/widgets/customedittext.dart';
import 'package:eduaction_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../presentation/widgets/buttons.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                CustomTextField(
                  text: 'نسيت كلمة المرور ',
                  color: Colors.black,
                  size: 25,
                  font: 'Cairo-SemiBold',
                ),
                SizedBox(height: 40),
                Image.asset('assets/images/auth/forgetpassword.png'),
                SizedBox(height: 50),
                CustomEditTextField(
                  labelText: 'البريد الالكتروني',
                  controller: _emailController,
                  suffixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  isRequired: true,
                ),
                SizedBox(height: 40),

                CustomButton(
                  text: 'تاكيد',
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.verifyCode)
                    ;
                  },
                  backgr: blueColor,
                  color: whiteColor,
                  width: 343,

                  borderRadius: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
