import 'package:all_in_one3/src/core/utils/assets.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/core/utils/util.dart';
import 'package:all_in_one3/src/core/widgets/delete_dailog.dart';
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
        deleteDailog(
          context: context,
          message: 'Deleted job is irreversible.',
          onTap: () {
            controller.deleteCompanyJob(job.id!).then((v) {
              controller.companyJobList.removeWhere((v) => v.id == job.id);
              SnackBarService.showInfoSnackBar('Successfully delete job.');
            });

            Navigator.of(context).pop();
          },
        );
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
}
