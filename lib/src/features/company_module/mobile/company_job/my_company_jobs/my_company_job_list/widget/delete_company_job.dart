import 'package:all_in_one3/src/core/theme/colors.dart';
import 'package:all_in_one3/src/core/utils/assets.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/core/utils/util.dart';
import 'package:all_in_one3/src/core/widgets/primary_button.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_job/my_company_jobs/my_company_job_list/controller/company_job_view_controller.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeletedCompanyJob extends GetView<CompanyJobViewController> {
  const DeletedCompanyJob({super.key, required this.job});
  final JobModel job;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showError(context, 'Deleted job is irreversible.');
      },
      child: Row(
        children: [
          Image.asset(height: 16, width: 16, Assets.trash),
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
      ),
    );
  }

  void _showError(BuildContext context, String message, {String? title}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? 'Do you want delete this job?',
                style: TextStyle(
                  color: Color(0xFF363636),
                  fontSize: 18,

                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 15),
              Divider(),
              Text(
                message,
                style: TextStyle(
                  color: Color(0xFF8A8A8A),
                  fontSize: 12,

                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 25),
              PrimaryButton(
                onTap: () {
                  controller.deleteCompanyJob(job.id!).then((v) {
                    controller.companyJobList.removeWhere(
                      (v) => v.id == job.id,
                    );
                    SnackBarService.showInfoSnackBar(
                      'Successfully delete job.',
                    );
                  });

                  Navigator.of(context).pop();
                },
                title: 'Yes, Delete',
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
        );
      },
    );
  }
}
