import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/formated_date_time.dart';
import 'package:all_in_one3/src/core/utils/assets.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/core/widgets/text_widget.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/jobs/widgets/deleted_saved_job_button.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/jobs/widgets/save_job_button_from_job_card.dart';
import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  const JobCard({
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 26,
          top: 29,
          right: 26,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: onTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    textAlign: TextAlign.center,
                    text: job.jobRole ?? '',
                    color: CommonColor.greyColor4,
                    maxLine: 1,
                    fontFamily: AppStrings.sfProDisplay,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                  const SizedBox(height: 7),
                  Row(
                    children: [
                      Image.asset(
                        Assets.location,
                        height: 20,
                        width: 20,
                        fit: BoxFit.fill,
                        // color: CommonColor.purpleColor1,
                      ),
                      const SizedBox(width: 15),
                      TextWidget(
                        textAlign: TextAlign.center,
                        text: job.workLocation ?? '',
                        color: CommonColor.greyColor12,
                        maxLine: 1,
                        fontFamily: AppStrings.sfProDisplay,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Image.asset(
                        Assets.payment,
                        height: 20,
                        width: 20,
                        fit: BoxFit.fill,
                        // color: CommonColor.purpleColor1,
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
                    ? DeletedSaveJobButtonFromJobCard(job: job)
                    : isFromAppliedJob
                    ? const Offstage()
                    : SaveJobButtonFromJobCard(job: job),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
