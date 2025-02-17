import 'package:all_in_one3/src/core/utils/image_constant.dart';
import 'package:flutter/material.dart';

class RegistrationHeader extends StatelessWidget {
  const RegistrationHeader({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              ImageConstant.appLogo,
              height: 48,
              width: 48,
              fit: BoxFit.fill,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Registration',
                  style: TextStyle(
                    color: Color(0xFF5A5959),
                    fontSize: 20,

                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Hey, welcome to All in one ✋',
                  style: TextStyle(
                    color: Color(0xFF5A5959),
                    fontSize: 14,

                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 30),
        Text(
          title,
          style: TextStyle(
            color: Color(0xFF5A5959),
            fontSize: 14,

            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
