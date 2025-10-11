import 'package:flutter/material.dart';
import 'package:eduaction_app/core/constants/colors.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> items = [
    {'icon': Icons.home_outlined, 'label': 'الرئيسية'},
    {'icon': Icons.chat_bubble_outline, 'label': 'الرسائل'},
    {'icon': Icons.search, 'label': ''}, // زر البحث (الأوسط)
    {'icon': Icons.video_camera_back_outlined, 'label': 'فيديوهاتي'},
    {'icon': Icons.person_outline, 'label': 'صفحتي'},
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 75,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, -3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              if (index == 2) {
                return const SizedBox(width: 60); // نحجز مكان البحث
              }

              final item = items[index];
              final isSelected = index == selectedIndex;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item['icon'],
                      color: isSelected ? blueColor : Colors.grey[700],
                      size: 26,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['label'],
                      style: TextStyle(
                        color: isSelected ? blueColor : Colors.grey[700],
                        fontFamily: 'Cairo-Bold',
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
        Positioned(
          top: -25,
          left: 0,
          right: 0,
          child: Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
              },
              child: Container(
                width: 65,
                height: 65,
                decoration: const BoxDecoration(
                  color: blueColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
