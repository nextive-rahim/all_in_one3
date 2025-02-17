import 'package:all_in_one3/src/core/theme/colors.dart';
import 'package:all_in_one3/src/core/utils/image_constant.dart';
import 'package:all_in_one3/src/core/utils/util.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/jobs/controller/job_view_controller.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeletedSaveJobButtonFromJobCard extends GetView<JobsViewController> {
  DeletedSaveJobButtonFromJobCard({super.key, required this.job});
  final JobModel job;
  final ValueNotifier<bool> isSavedJob = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.deleteSaveJob(job.id!).then((value) {
          if (value.success == true) {
            controller.savedJobList.removeWhere(
              (element) => element.id == job.id,
            );
            SnackBarService.showInfoSnackBar('Successfully delete Saved job');

            controller.getjobList();
            // Get.find<AppliedJobsViewController>().appliedjobList();
          } else {
            SnackBarService.showErrorSnackBar('Failed Save job');
          }
        });
      },
      child: ValueListenableBuilder<bool>(
        valueListenable: isSavedJob,
        builder: (BuildContext context, bool value, child) {
          return Row(
            children: [
              Image.asset(
                ImageConstant.trash,
                width: 18,
                height: 18,
                color: AppColors.black,
              ),
              const SizedBox(width: 5),
              // TextWidget(
              //   textAlign: TextAlign.start,
              //   text: "Delete",
              //   color: CommonColor.redColors,
              //   maxLine: 1,
              //   fontFamily: AppStrings.sfProDisplay,
              //   fontWeight: FontWeight.w400,
              //   fontSize: 16,
              // ),
            ],
          );
        },
      ),
    );
  }
}
