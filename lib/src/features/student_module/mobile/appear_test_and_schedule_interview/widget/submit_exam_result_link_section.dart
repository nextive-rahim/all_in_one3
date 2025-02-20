import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/core/utils/util.dart';
import 'package:all_in_one3/src/core/validators/input_form_validators.dart';
import 'package:all_in_one3/src/core/widgets/text_form_field.dart';
import 'package:all_in_one3/src/core/widgets/text_widget.dart';
import 'package:all_in_one3/src/features/student_module/mobile/appear_test_and_schedule_interview/controller/sunmit_result_link_view_controller.dart';
import 'package:all_in_one3/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubmitExamResultLinkSection
    extends GetView<SubmitResultLinkViewController> {
  const SubmitExamResultLinkSection({super.key, required this.course});
  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          text: AppStrings.pasteYourResultsFromFlipgrid,
          color: CommonColor.blackColor2,
          maxLine: 1,
          fontFamily: AppStrings.sfProDisplay,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        const SizedBox(height: 12),
        OutlinedInputField(
          controller: controller.submitExamLinkController,
          hintText: AppStrings.pasteYourLinkHere,
          validator: InputFieldValidator.name(),
          prefix: const Icon(Icons.link),
          onChanged: (p0) {},
        ),
        const SizedBox(height: 8),
        const TextWidget(
          text: AppStrings.pleaseEnsureFlipgridOnly,
          color: CommonColor.blackColor1,
          maxLine: 2,
          fontFamily: AppStrings.inter,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {
            if (controller.submitExamLinkController.text.isNotEmpty) {
              controller
                  .submitExamLink(course.id!)
                  .then(
                    (value) => SnackBarService.showInfoSnackBar(
                      'Successfully submitted result link',
                    ),
                  );
              controller.isSubmittedResultLink = true;
              controller.submitExamLinkController.clear();
            } else {
              SnackBarService.showErrorSnackBar(
                'Please enter exam result link',
              );
            }
          },
          child: Container(
            width: 165,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: CommonColor.purpleColor1,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFFEBEBEB)),
                borderRadius: BorderRadius.circular(8),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x0C101828),
                  blurRadius: 2,
                  offset: Offset(0, 1),
                  spreadRadius: 0,
                ),
              ],
            ),

            child: const Center(
              child: Text(
                AppStrings.submit,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: CommonColor.whiteColor,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 1.43,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
