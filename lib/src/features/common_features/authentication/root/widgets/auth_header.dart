import 'package:all_in_one3/src/core/utils/image_constant.dart';
import 'package:all_in_one3/src/core/utils/size_config.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    this.subtitle,
    this.title,
  });
  final String? title;
  final String? subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: SizeConfig.screenWidth,
          alignment: Alignment.center,
          child: Image.asset(
            ImageConstant.appLogo,
            height: 64,
            width: 64,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title ?? AppStrings.chooseEngagement,
          style: TextStyle(
            color: Color(0xFF5A5959),
            fontSize: 28,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle ?? AppStrings.chooseEngagement,
          style: TextStyle(
            color: Color(0xFF5A5959),
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
