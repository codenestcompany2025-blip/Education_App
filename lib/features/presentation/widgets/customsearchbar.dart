import 'package:flutter/material.dart';
import 'package:eduaction_app/core/constants/colors.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onFilterTap;

  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFF8F8F8),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                SizedBox(width: 10),
                Icon(Icons.search, color: AppColors.blueColor, size: 23),
                SizedBox(width: 10),
                Text(
                  'بحث',
                  style: TextStyle(
                    fontFamily: 'Cairo-Regular',
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.tune, color: AppColors.blueColor, size: 24),
              onPressed: onFilterTap,
            ),


          ],
        ),
      ),
    );
  }
}
