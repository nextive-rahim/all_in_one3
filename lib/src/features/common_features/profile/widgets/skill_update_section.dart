import 'package:all_in_one3/src/core/theme/colors.dart';
import 'package:all_in_one3/src/core/theme/text_style.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/widgets/primary_button.dart';
import 'package:all_in_one3/src/features/common_features/profile/controller/profile_update_view_controller.dart';
import 'package:all_in_one3/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one3/src/features/common_features/skill/widget/skill-builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkillUpdateSection extends GetView<UpdateProfileiewController> {
  const SkillUpdateSection({super.key});
  // final SkillViewController skillController = Get.put(SkillViewController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showError(
          context,
          SkillBuilder(
            selectedSkillIdList: controller.selectedSkillIdList,
            selectedSkillNameList: controller.selectedSkillNameList,
          ),
          title: "Selecte skills",
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selects kills',
            style: AppTextStyle.medium14.copyWith(color: AppColors.black),
          ),
          const SizedBox(height: 6),
          Container(
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(width: .5, color: AppColors.lightBlack40),
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Obx(
                    () =>
                        Get.find<ProfileViewController>()
                                .profileResponseModel
                                .userSkill!
                                .isEmpty
                            ? Text(
                              controller.selectedSkillNameList.isEmpty
                                  ? 'Select Skills'
                                  : List<String>.generate(
                                    controller.selectedSkillNameList.length,
                                    (int index) =>
                                        controller.selectedSkillNameList[index],
                                  ).toString(),
                              style: const TextStyle(
                                color: CommonColor.hintTextColor,
                              ),
                            )
                            : controller.selectedSkillNameList.isNotEmpty
                            ? Text(
                              List<String>.generate(
                                controller.selectedSkillNameList.length,
                                (int index) =>
                                    controller.selectedSkillNameList[index],
                              ).toString(),
                            )
                            : Text(
                              List<String>.generate(
                                Get.find<ProfileViewController>()
                                    .profileResponseModel
                                    .userSkill!
                                    .length,
                                (int index) {
                                  return Get.find<ProfileViewController>()
                                          .profileResponseModel
                                          .userSkill![index]
                                          .skill ??
                                      '';
                                },
                              ).toString(),
                            ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(Icons.arrow_drop_down, color: Color(0xFF667084)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showError(BuildContext context, Widget message, {String? title}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? 'Are Your Sure?',
                style: TextStyle(
                  color: Color(0xFF363636),
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 15),
              Divider(),

              message,
              SizedBox(height: 25),
              PrimaryButton(
                onTap: () {
                  Get.back();
                },
                title: 'Confirm',
              ),
              SizedBox(height: 12),
              PrimaryButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                widget: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    // height: 1.56,
                  ),
                ),

                backgroundColor: AppColors.transparent,
              ),
            ],
          ),
        );
      },
    );
  }
}
