import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/formated_date_time.dart';
import 'package:all_in_one3/src/core/utils/image_constant.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/core/widgets/text_widget.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_job/other_jobs/widgets/company_deleted_saved_job_button.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_job/other_jobs/widgets/company_save_job_button_from_job_card.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';

class OtherCompanyJobCard extends StatelessWidget {
  const OtherCompanyJobCard({
    super.key,
    required this.job,
    required this.onTap,
    this.isFromSaveJob = false,
    this.isFromAppliedJob = false,
  });
  final bool isFromSaveJob;
  final bool isFromAppliedJob;
  final JobModel job;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          top: 25,
          right: 20,
          bottom: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: onTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    job.jobRole ?? '',
                    style: TextStyle(
                      color: Color(0xFF363636),
                      fontSize: 18,

                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 7),
                  TextWidget(
                    textAlign: TextAlign.center,
                    text: job.workLocation ?? '',
                    color: CommonColor.greyColor12,
                    maxLine: 1,
                    fontFamily: AppStrings.sfProDisplay,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Image.asset(
                        ImageConstant.payment,
                        height: 20,
                        width: 20,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(width: 15),
                      TextWidget(
                        textAlign: TextAlign.center,
                        text: "${job.paysalary ?? ''}/yr.",
                        color: CommonColor.greyColor4,
                        maxLine: 1,
                        fontFamily: AppStrings.sfProDisplay,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const SizedBox(height: 18),
                  TextWidget(
                    textAlign: TextAlign.start,
                    text: job.jobDescription ?? '',
                    color: CommonColor.greyColor12,
                    maxLine: 2,
                    fontFamily: AppStrings.sfProDisplay,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  textAlign: TextAlign.start,
                  text:
                      "Posted ${FormatedDateTime.readTimestamp(int.parse(job.time ?? "0"))}",
                  color: CommonColor.greyColor12,
                  maxLine: 1,
                  fontFamily: AppStrings.sfProDisplay,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
                isFromSaveJob
                    ? DeleteOtherCompanySavedJobCard(job: job)
                    : isFromAppliedJob
                    ? const Offstage()
                    : CompanySaveJobButtonFromJobCard(job: job),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
