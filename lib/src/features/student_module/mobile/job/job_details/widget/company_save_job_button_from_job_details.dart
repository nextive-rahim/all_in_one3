import 'package:all_in_one3/src/core/theme/colors.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/core/utils/util.dart';
import 'package:all_in_one3/src/core/widgets/primary_button.dart';
import 'package:all_in_one3/src/core/widgets/text_widget.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_job/other_jobs/controller/other_company_job_view_controller.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanySaveJobButtonFromJobDetails
    extends GetView<OtherCompanyJobsViewController> {
  CompanySaveJobButtonFromJobDetails({
    super.key,
    required this.job,
  });
  final JobModel job;
  final ValueNotifier<bool> isSavedJob = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isSavedJob,
      builder: (BuildContext context, bool value, child) {
        return Obx(
          () => PrimaryButton(
            backgroundColor: job.isSaved != 0 || value
                ? AppColors.grey
                : CommonColor.purpleColor1,
            isLoading: controller.isLoadingSavedJob.value == true,
            onTap: () {
              if (job.isSaved != 0 || isSavedJob.value) {
                SnackBarService.showErrorSnackBar('Job is already Saved');

                return;
              }
              controller.saveJob(job.id!).then((value) {
                if (value.success == true) {
                  isSavedJob.value = true;
                  SnackBarService.showInfoSnackBar('Successfully Saved job');

                  // controller.savedjobList();
                  controller.getOtherCompanyjobList();
                } else {
                  SnackBarService.showErrorSnackBar('Failed Save job');
                }
              });
            },
            widget: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.bookmark_border,
                  size: 20,
                  color: CommonColor.whiteColor,
                ),
                SizedBox(width: 8),
                TextWidget(
                  textAlign: TextAlign.center,
                  text: AppStrings.savedJobs,
                  color: CommonColor.whiteColor,
                  maxLine: 1,
                  fontFamily: AppStrings.inter,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
