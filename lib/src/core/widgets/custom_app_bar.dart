import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double? toolbarHeight;
  const CustomAppBar({super.key, required this.title,this.toolbarHeight});

  @override
  Widget build(BuildContext context) {
    return AppBar(
       leadingWidth: 100,
       toolbarHeight: toolbarHeight,
      // centerTitle: false,
      leading: Row(
        children: [
          SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF8A8A8A),
              size: 16,
            ),
          ),
          Text(
            'Back',
            style: TextStyle(
              color: Color(0xFF8A8A8A),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              height: 1.50,
            ),
          ),
        ],
      ),
      title: Text(
       title,
        style: TextStyle(
          color: Color(0xFF262626),
          fontSize: 20,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
    
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
