import 'package:all_in_one3/src/core/routes/app_pages.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/assets.dart';
import 'package:all_in_one3/src/core/utils/size_config.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one3/src/features/common_features/profile/model/profile_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileBodySection extends StatelessWidget {
  const ProfileBodySection({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Skills:',
          style: TextStyle(
            color: Color(0xFF363636),
            fontSize: 18,

            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          List<String>.generate(
            Get.find<ProfileViewController>()
                .profileResponseModel
                .userSkill!
                .length,
            (int index) =>
                Get.find<ProfileViewController>()
                    .profileResponseModel
                    .userSkill![index]
                    .skill ??
                '',
          ).toString(),
          style: TextStyle(
            color: Color(0xFF363636),
            fontSize: 14,

            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Address:',
          style: TextStyle(
            color: Color(0xFF363636),
            fontSize: 18,

            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          userModel.address ?? 'Not Found Address',
          style: TextStyle(
            color: Color(0xFF363636),
            fontSize: 14,

            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: SizeConfig.screenWidth,
          height: 1,
          color: CommonColor.greyColor18,
        ),
        const SizedBox(height: 10),
        const Text(
          AppStrings.description,
          style: TextStyle(
            color: Color(0xFF363636),
            fontSize: 18,

            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          userModel.description ?? 'Not Found Description',
          style: TextStyle(
            color: Color(0xFF363636),
            fontSize: 14,

            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 30),
        const Text(
          'Resume : ',
          style: TextStyle(
            color: Color(0xFF363636),
            fontSize: 18,

            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 5),
        Card(
          elevation: 5,
          child: InkWell(
            onTap: () {
              Get.toNamed(Routes.resume, arguments: userModel.resume ?? '');
            },
            child: SizedBox(
              width: 142,
              height: 199,
              child: Image.asset(Assets.cv, cacheHeight: 522, cacheWidth: 372),
            ),
          ),
        ),
      ],
    );
  }
}
