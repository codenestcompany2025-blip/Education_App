import 'package:eduaction_app/features/auth/screens/verifycode.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../presentation/widgets/buttons.dart';
import '../../presentation/widgets/custom_textfield.dart';
import '../../presentation/widgets/customdialog.dart';
import '../../presentation/widgets/customedittext.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Image.asset('assets/images/auth/resetpassword.png'),
                SizedBox(height: 50),
                CustomTextField(
                  text: 'اعادة تعيين كلمة المرور',
                  color: Colors.black,
                  size: 25,
                  font: 'Cairo-Bold',
                ),
                SizedBox(height: 40),
                CustomEditTextField(
                  labelText: 'كلمة المرور',
                  controller: _passwordController,
                  isRequired: true,
                  isPassword: true,
                  suffixIcon: Icons.lock_outline,
                ),
                SizedBox(height: 40),

                CustomButton(
                  text: 'تاكيد',
                  onPressed: () {
                    showSuccessDialog(context);
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
