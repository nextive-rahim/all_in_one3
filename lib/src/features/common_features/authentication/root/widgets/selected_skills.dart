import 'package:all_in_one3/src/core/theme/colors.dart';
import 'package:all_in_one3/src/core/widgets/primary_button.dart';
import 'package:all_in_one3/src/features/common_features/authentication/registration/controller/registration_view_controller.dart';
import 'package:all_in_one3/src/features/common_features/skill/widget/skill-builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectedSkills extends GetView<RegistrationViewController> {
  const SelectedSkills({super.key});

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
            'Select skills',
            style: TextStyle(
              color: Color(0xFF344053),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1.43,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            height: 47,
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
                  padding: const EdgeInsets.only(left: 13),
                  child: Obx(
                    () =>
                        controller.selectedSkillIdList.isEmpty
                            ? const Text(
                              'Select your skills',
                              style: TextStyle(
                                color: Color(0xFF667084),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 1.50,
                              ),
                            )
                            : Text(
                              List<String>.generate(
                                controller.selectedSkillNameList.length,
                                (int index) =>
                                    controller.selectedSkillNameList[index],
                              ).toString(),
                            ),
                  ),
                ),
                Icon(Icons.arrow_drop_down),
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
          // content: message,

          // actions: [
          //   TextButton(
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //     child: const Text('Cancel'),
          //   ),
          //   TextButton(
          //     onPressed: () {
          //       Get.back();
          //     },
          //     child: const Text('Confirm'),
          //   ),
          // ],
        );
      },
    );
  }
}
