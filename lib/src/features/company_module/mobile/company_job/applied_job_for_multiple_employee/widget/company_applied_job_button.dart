import 'package:all_in_one3/src/core/theme/colors.dart';
import 'package:all_in_one3/src/core/theme/text_style.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/util.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_job/applied_job_for_multiple_employee/controller/company_applied_job_view_controller.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_job/other_jobs/controller/other_company_job_view_controller.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyAppliedJobButton extends GetView<CompanyAppliedJobViewController> {
  const CompanyAppliedJobButton({
    super.key,
    required this.job,
  });
  final JobModel job;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.courseIDList.isEmpty) {
          SnackBarService.showErrorSnackBar('Selected at least one job');

          return;
        }
        controller.companyAppliedjob(job.id!).then(
          (value) {
            if (value.success == true) {
              Get.back();
              Get.back();
              Get.find<OtherCompanyJobsViewController>()
                  .getOtherCompanyjobList();
              SnackBarService.showInfoSnackBar('Apply job successfully.');
            } else {
              SnackBarService.showErrorSnackBar('Apply job Failed.');
            }
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
          left: 20,
          right: 20,
        ),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CommonColor.blueColor1),
          child: Center(
            child: Text(
              'Apply Job',
              style: AppTextStyle.bold16.copyWith(color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
