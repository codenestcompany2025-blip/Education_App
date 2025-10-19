import 'package:eduaction_app/core/constants/colors.dart';
import 'package:eduaction_app/features/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class TeacherDetailsCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final String bio;
  final String experience;
  final String email;
  final String phone;
  final String address;

  const TeacherDetailsCard({
    super.key,
    required this.name,
    required this.imagePath,
    required this.bio,
    required this.experience,
    required this.email,
    required this.phone,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 360),
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 12, offset: const Offset(0, 4)),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                CircleAvatar(radius: 28, backgroundImage: AssetImage(imagePath)),
                const SizedBox(width: 12),
                customTextField(text: name, size: 18, color: AppColors.blueColor),
              ],
            ),

            const SizedBox(height: 20),
            customTextField(text: 'نبذة عنه', size: 15, color: Colors.black),
            const SizedBox(height: 6),
            customTextField(text: bio, size: 14, color: Colors.black),

            const SizedBox(height: 20),

            _infoRow(Icons.timer_outlined, experience),
            _infoRow(Icons.email_outlined, email),
            _infoRow(Icons.phone_outlined, phone),
            _infoRow(Icons.location_on_outlined, address),

            const SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  // TODO: Add your chat navigation here
                },
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: AppColors.blueColor.withValues(alpha: 0.1), shape: BoxShape.circle),
                  child: const Icon(Icons.chat_outlined, color: AppColors.blueColor, size: 26),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: AppColors.blueColor, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: customTextField(text: text, size: 14, color: Colors.black),
          ),
        ],
      ),
    );
  }