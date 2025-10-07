import 'dart:async';
import 'package:eduaction_app/features/auth/screens/resetpassword.dart';
import 'package:eduaction_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:eduaction_app/core/constants/colors.dart';
import 'package:eduaction_app/features/presentation/widgets/buttons.dart';
import 'package:eduaction_app/features/presentation/widgets/custom_textfield.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  final List<TextEditingController> _controllers =
  List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  late Timer _timer;
  int _secondsRemaining = 120;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();

    // 🔹 إضافة Listeners على كل FocusNode لتحديث الحالة عند تغيير الفوكس
    for (var node in _focusNodes) {
      node.addListener(() => setState(() {}));
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _canResend = true;
        });
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  void _resendCode() {
    setState(() {
      _secondsRemaining = 120;
      _canResend = false;
    });
    _startTimer();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("✅ تم إرسال رمز جديد")),
    );
  }

  void _verifyCode() {
    final code = _controllers.map((c) => c.text).join();
    if (code.length == 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("✅ تم التحقق من الرمز: $code")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("⚠️ الرجاء إدخال الرمز الكامل")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Image.asset('assets/images/auth/verify.png', height: 160),
              const SizedBox(height: 30),
              const CustomTextField(
                text: 'رمز التحقق',
                color: Colors.black,
                size: 25,
                font: 'Cairo-SemiBold',
              ),
              const SizedBox(height: 30),

              // 🔹 مربعات الكود مع تأثير الفوكس
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  bool isFocused = _focusNodes[index].hasFocus;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 55,
                    height: 60,
                    decoration: BoxDecoration(
                      color: isFocused ? Colors.blue[50] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isFocused ? Colors.blue : Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      cursorColor: Colors.blue,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        counterText: "",
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          // ينتقل تلقائيًا للمربع التالي
                          if (index < 3) {
                            FocusScope.of(context)
                                .requestFocus(_focusNodes[index + 1]);
                          } else {
                            FocusScope.of(context).unfocus();
                          }
                        } else if (value.isEmpty && index > 0) {
                          // يرجع للمربع السابق عند الحذف
                          FocusScope.of(context)
                              .requestFocus(_focusNodes[index - 1]);
                        }
                      },
                    ),
                  );
                }),
              ),

              const SizedBox(height: 25),

              // 🔹 عداد الوقت أو إعادة الإرسال
              _canResend
                  ? GestureDetector(
                onTap: _resendCode,
                child: const Text(
                  "إعادة إرسال الرمز",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("إعادة الإرسال خلال "),
                  Text(
                    _formatTime(_secondsRemaining),
                    style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              CustomButton(
                text: 'تأكيد',
                onPressed: (){
                  Navigator.pushNamed(context, AppRoutes.resetPassword);
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
    );
  }
}
