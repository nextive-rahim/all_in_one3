import 'package:all_in_one3/src/core/theme/colors.dart';
import 'package:all_in_one3/src/core/theme/text_style.dart';
import 'package:all_in_one3/src/core/utils/util.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_job/my_company_jobs/my_company_job_list/controller/company_job_view_controller.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_job/post_new_job/controller/post_company_new_job_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostNewJobButton extends GetView<PostCompanyNewJobViewController> {
  const PostNewJobButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () {
          if (!controller.formKey.currentState!.validate()) {
            SnackBarService.showErrorSnackBar('Please fill the field.');

            return;
          }
          if (controller.isFromPostEdit.value) {
            controller.editCompanyJob(controller.job!.id!).then((value) {
              if (value.success == true) {
                Get.back();
                SnackBarService.showInfoSnackBar('Post Edit Successfully');

                Get.find<CompanyJobViewController>().getCompanyjobList();
              }
            });
          } else {
            controller.postNewJob().then((value) {
              if (value.success == true) {
                Get.back();
                SnackBarService.showInfoSnackBar('Post Added Successfully');

                Get.find<CompanyJobViewController>().getCompanyjobList();
              }
            });
          }
        },
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.deepBlue,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              controller.isFromPostEdit.value ? 'Edit job' : 'Post Job',
              textAlign: TextAlign.center,
              style: AppTextStyle.bold16.copyWith(color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
