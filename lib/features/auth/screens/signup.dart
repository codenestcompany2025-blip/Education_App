import 'package:eduaction_app/features/presentation/widgets/customedittext.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../core/constants/colors.dart';
import '../../../routes/app_routes.dart';
import '../../presentation/widgets/buildicons.dart';
import '../../presentation/widgets/buttons.dart';
import '../../presentation/widgets/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  final String userType;

  const SignUpScreen({super.key, required this.userType});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final isTawjehi = widget.userType == 'tawjehi';
    final title = "انشاء حساب";
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
        child: Center(
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
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              CustomEditTextField(
                labelText: 'البريد الالكتروني',
                controller: _emailController,
                suffixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                isRequired: true,
              ),
              const SizedBox(height: 20),
              IntlPhoneField(
                controller: _phoneController,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  labelText: "رقم الجوال",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                initialCountryCode: 'PS',
                showDropdownIcon: false,
              ),
              const SizedBox(height: 20),
              CustomEditTextField(
                labelText: 'كلمة المرور',
                controller: _passwordController,
                isRequired: true,
                isPassword: true,
                suffixIcon: Icons.lock_outline,
              ),
              const SizedBox(height: 20),
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
                    text: "اوافق على شروط واحكام وسياسة الخصوصية",
                    font: 'Cairo-SemiBold',
                    size: 16,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomButton(
                text: 'تسجيل جديد',
                onPressed: () {},
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
                  BuildSocialButton(
                    imagePath: 'assets/images/auth/twitter.png',
                  ),
                  const SizedBox(width: 20),
                  BuildSocialButton(
                    imagePath: 'assets/images/auth/facebook.png',
                  ),
                  const SizedBox(width: 20),
                  BuildSocialButton(imagePath: 'assets/images/auth/google.png'),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomTextField(
                    text: 'هل لديك حساب؟ ',
                    font: 'Cairo-SemiBold',
                    size: 18,
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, AppRoutes.login);
                    },
                    child: const CustomTextField(
                      text: 'تسجيل الدخول',
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
      ),
    );
  }
}
