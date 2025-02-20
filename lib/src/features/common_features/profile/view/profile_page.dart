import 'package:all_in_one3/src/core/page_state/state.dart';
import 'package:all_in_one3/src/core/routes/app_pages.dart';
import 'package:all_in_one3/src/core/utils/assets.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/size_config.dart';
import 'package:all_in_one3/src/core/utils/util.dart';
import 'package:all_in_one3/src/core/widgets/add_container.dart';
import 'package:all_in_one3/src/core/widgets/delete_dailog.dart';
import 'package:all_in_one3/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one3/src/features/common_features/profile/widgets/profile_body_section.dart';
import 'package:all_in_one3/src/features/common_features/profile/widgets/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileViewController> {
  ProfilePage({super.key}) {
    // controller.profile();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: CommonColor.greyColor1,
        body: Obx(() {
          if (controller.pageState == PageState.loading) {
            return const CircularProgressIndicator();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Obx(() {
                    if (controller.pageState == PageState.loading) {
                      return const CircularProgressIndicator();
                    }
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ProfileHeader(),
                          const SizedBox(height: 21),
                          Container(
                            width: SizeConfig.screenWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: CommonColor.whiteColor,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x19000000),
                                  blurRadius: 80,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                                bottom: 44,
                                top: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ProfileBodySection(
                                    userModel: controller.userModel!,
                                  ),
                                  const SizedBox(height: 22),
                                  // PrimaryButton(
                                  //   onTap: () {
                                  //     Get.toNamed(
                                  //         Routes.profileUpdatePage);
                                  //   },
                                  //   widget: Text(
                                  //     AppStrings.editProfile,
                                  //     style: AppTextStyle.bold16.copyWith(
                                  //         color: AppColors.white),
                                  //   ),
                                  // ),
                                  // const SizedBox(height: 10),
                                  // PrimaryButton(
                                  //   onTap: () {
                                  //     Get.toNamed(Routes.changePassword);
                                  //   },
                                  //   widget: Text(
                                  //     'Change Password',
                                  //     style: AppTextStyle.bold16.copyWith(
                                  //       color: AppColors.white,
                                  //     ),
                                  //   ),
                                  // ),
                                  AddContainer(
                                    onTap: () {
                                      Get.toNamed(Routes.changePassword);
                                    },
                                    title: 'Change Password',
                                    icon: Assets.edit,
                                  ),

                                  AddContainer(
                                    onTap: () {
                                      deleteDailog(
                                        context: context,
                                        message:
                                            'Once logged out, you will need to login again to access this app.',
                                        onTap: () {
                                          Util.logout(context);
                                        },
                                        title: 'Are you sure?',
                                        yesText: 'Yes, logout',
                                      );
                                    },
                                    title: 'Logout',
                                    icon: Assets.logout,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
