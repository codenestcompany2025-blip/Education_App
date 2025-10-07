import 'package:eduaction_app/core/constants/colors.dart';
import 'package:eduaction_app/features/auth/screens/forgetpassword.dart';
import 'package:eduaction_app/features/presentation/widgets/buttons.dart';
import 'package:eduaction_app/features/presentation/widgets/custom_textfield.dart';
import 'package:eduaction_app/features/presentation/widgets/customedittext.dart';
import 'package:eduaction_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../../presentation/widgets/buildicons.dart';

class SignInScreen extends StatefulWidget {
  final String userType;

  const SignInScreen({super.key, required this.userType});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isPasswordVisible = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final isTawjehi = widget.userType == 'tawjehi';
    final title = "تسجيل الدخول إلى حسابك";
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Image.asset(
              isTawjehi
                  ? "assets/images/auth/twjehe.png"
                  : "assets/images/auth/courses.png",
              width: 120,
              height: 120,
            ),
            const SizedBox(height: 30),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            CustomEditTextField(
              labelText: "البريد الإلكتروني",
              controller: _emailController,
              suffixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              isRequired: true,
            ),
            const SizedBox(height: 25),
            CustomEditTextField(
              labelText: "كلمة المرور",
              controller: _passwordController,
              isPassword: true,
              suffixIcon: Icons.lock_outline,
              isRequired: true,
            ),
            const SizedBox(height: 10),

            // 🔹 تذكرني + نسيت كلمة المرور في صف واحد
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    StatefulBuilder(
                      builder: (context, setState) {
                        return Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value ?? false;
                            });
                          },
                          activeColor: blueColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      },
                    ),
                    const CustomTextField(
                      text: "تذكرني",
                      font: 'Cairo-SemiBold',
                      size: 16,
                    ),
                  ],
                ),

                // 🔹 رابط "نسيت كلمة المرور"
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.forgetPassword);
                  },
                  child: const Text(
                    "نسيت كلمة المرور؟",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            CustomButton(
              text: 'تسجيل الدخول',
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.chooseSpecialization);
              },
              backgr: blueColor,
              color: whiteColor,
              width: 343,

              borderRadius: 8,
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Expanded(child: Divider(thickness: 1)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: CustomTextField(
                    text: "أو",
                    size: 18,
                    font: 'Cairo-Bold',
                  ),
                ),
                Expanded(child: Divider(thickness: 1)),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildSocialButton( imagePath: 'assets/images/auth/twitter.png',),
                const SizedBox(width: 20),
                BuildSocialButton(imagePath: 'assets/images/auth/facebook.png',),
                const SizedBox(width: 20),
                BuildSocialButton(imagePath: 'assets/images/auth/google.png',),

              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const CustomTextField(
                  text: 'ليس لديك حساب؟ ',
                  font: 'Cairo-SemiBold',
                  size: 18,

                ),

                TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, AppRoutes.signup);

                  },
                  child: const CustomTextField(
                    text: 'قم بالتسجيل ',
                    font: 'Cairo-SemiBold',
                    size: 18,
                    color: blueColor,
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }


}
