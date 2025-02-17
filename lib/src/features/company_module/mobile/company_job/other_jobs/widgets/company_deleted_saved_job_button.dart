import 'package:all_in_one3/src/core/utils/image_constant.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/core/utils/util.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_job/other_jobs/controller/other_company_job_view_controller.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteOtherCompanySavedJobCard
    extends GetView<OtherCompanyJobsViewController> {
  DeleteOtherCompanySavedJobCard({super.key, required this.job});
  final JobModel job;
  final ValueNotifier<bool> isSavedJob = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.deleteSaveJob(job.id!).then((value) {
          if (value.success == true) {
            controller.companySavedJobList.removeWhere(
              (element) => element.id == job.id,
            );
            SnackBarService.showInfoSnackBar('Successfully Delete Saved job');

            controller.getOtherCompanyjobList();
            // Get.find<AppliedJobsViewController>().appliedjobList();
          } else {
            SnackBarService.showErrorSnackBar('Failed  Delete Saved job');
          }
        });
      },
      child: ValueListenableBuilder<bool>(
        valueListenable: isSavedJob,
        builder: (BuildContext context, bool value, child) {
          return Row(
            children: [
              Image.asset(height: 16, width: 16, ImageConstant.trash),
              const SizedBox(width: 5),
              const Text(
                textAlign: TextAlign.start,
                AppStrings.delete,
                style: TextStyle(
                  color: Color(0xFF363636),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
