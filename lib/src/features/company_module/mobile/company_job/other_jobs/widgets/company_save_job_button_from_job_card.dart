import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/util.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_job/other_jobs/controller/other_company_job_view_controller.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanySaveJobButtonFromJobCard
    extends GetView<OtherCompanyJobsViewController> {
  CompanySaveJobButtonFromJobCard({super.key, required this.job});
  final JobModel job;
  final ValueNotifier<bool> isSavedJob = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isSavedJob.value || job.isSaved != 0) {
          SnackBarService.showErrorSnackBar('Job is already saved');

          return;
        }
        controller.saveJob(job.id!).then((value) {
          if (value.success == true) {
            isSavedJob.value = true;
            SnackBarService.showInfoSnackBar('Successfully Saved job');

            controller.getOtherCompanyjobList();
            controller.companySavedJobList.add(job);
          } else {
            isSavedJob.value = false;
            SnackBarService.showErrorSnackBar('Failed Save job');
          }
        });
      },
      child: ValueListenableBuilder<bool>(
        valueListenable: isSavedJob,
        builder: (BuildContext context, bool value, child) {
          return Row(
            children: [
              Icon(
                value || job.isSaved != 0
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined,
                size: 16,
                color:
                    value || job.isSaved != 0
                        ? CommonColor.blueColor1
                        : CommonColor.blackColor1,
              ),
              const SizedBox(width: 5),
              const Text(
                textAlign: TextAlign.start,
                "Save",
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
