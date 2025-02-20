import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/assets.dart';
import 'package:all_in_one3/src/core/utils/size_config.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/core/utils/util.dart';
import 'package:all_in_one3/src/core/validators/input_form_validators.dart';
import 'package:all_in_one3/src/core/widgets/text_form_field.dart';
import 'package:all_in_one3/src/core/widgets/text_widget.dart';
import 'package:all_in_one3/src/features/student_module/mobile/appear_test_and_schedule_interview/controller/student_interview_request_view_controller.dart';
import 'package:all_in_one3/src/features/student_module/mobile/appear_test_and_schedule_interview/controller/submit_portfolio_link_view_controller.dart';
import 'package:all_in_one3/src/features/student_module/mobile/appear_test_and_schedule_interview/controller/sunmit_result_link_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubmitPortfolioLinkSection extends StatefulWidget {
  const SubmitPortfolioLinkSection({super.key});

  @override
  State<SubmitPortfolioLinkSection> createState() =>
      _SubmitPortfolioLinkSectionState();
}

class _SubmitPortfolioLinkSectionState
    extends State<SubmitPortfolioLinkSection> {
  final controller = Get.find<SubmitPortfolioLinkSubmitViewController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: SizeConfig.screenWidth,
          height: 1,
          color: CommonColor.greyColor18,
        ),
        const SizedBox(height: 40),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  alignment: Alignment.center,
                  decoration: const ShapeDecoration(
                    color: CommonColor.whiteColor,
                    shape: CircleBorder(),
                    shadows: [
                      BoxShadow(
                        color: Color(0x33000000),
                        blurRadius: 3.75,
                        offset: Offset(0, 1.50),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Image.asset(Assets.clipboardDownload),
                ),
                const SizedBox(height: 8),
                const TextWidget(
                  text: "02",
                  color: CommonColor.greyColor11,
                  maxLine: 1,
                  fontFamily: AppStrings.sfProDisplay,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ],
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: AppStrings.step02,
                    color: CommonColor.greyColor12,
                    maxLine: 1,
                    fontFamily: AppStrings.sfProDisplay,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  SizedBox(height: 7),
                  TextWidget(
                    text: AppStrings.submitYourProjectPortfolioLink,
                    color: CommonColor.blackColor1,
                    maxLine: 2,
                    fontFamily: AppStrings.sfProDisplay,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        OutlinedInputField(
          controller: controller.submitExamLinkController,
          hintText: "www.github.io/myportfolio",
          validator: InputFieldValidator.name(),
          prefix: const Icon(Icons.link),
          suffix: const Icon(
            Icons.help_outline,
            color: CommonColor.greyColor19,
            size: 18,
          ),
        ),
        const SizedBox(height: 8),
        const TextWidget(
          text: AppStrings.pleaseEnterValidGithubURLProceed,
          color: CommonColor.greyColor20,
          maxLine: 2,
          fontFamily: AppStrings.inter,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            if (controller.submitExamLinkController.text.isNotEmpty) {
              if (!Get.find<SubmitResultLinkViewController>()
                  .isSubmittedResultLink) {
                SnackBarService.showErrorSnackBar(
                  'Please submit the link first',
                );

                return;
              }
              controller.submitPortfolioLink(1).then((value) {
                SnackBarService.showInfoSnackBar(
                  'Successfully submitted portfolio link',
                );
              });
              Get.find<StudentInterviewRequestViewController>()
                  .activeRequistForInterview
                  .value = true;
            }
            FocusManager.instance.primaryFocus?.unfocus();
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
                AppStrings.saveURL,
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
