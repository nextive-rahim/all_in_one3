import 'package:all_in_one3/src/core/theme/text_style.dart';
import 'package:all_in_one3/src/core/widgets/custom_app_bar.dart';
import 'package:all_in_one3/src/features/common_features/profile/controller/profile_update_view_controller.dart';
import 'package:all_in_one3/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one3/src/features/common_features/profile/widgets/update_profile_button.dart';
import 'package:all_in_one3/src/features/common_features/profile/widgets/update_profile_form.dart';
import 'package:all_in_one3/src/features/common_features/profile/widgets/update_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileUpdatePage extends GetView<UpdateProfileiewController> {
  ProfileUpdatePage({super.key}) {
    controller.profileDataPopulate(
      Get.find<ProfileViewController>().profileResponseModel,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(title: ''),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text('Update Profile', style: AppTextStyle.bold20),
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 90),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [UpdateProfileImageSecton(), UpdateProfileForm()],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const UpdateProfileButton(),
    );
  }
}
