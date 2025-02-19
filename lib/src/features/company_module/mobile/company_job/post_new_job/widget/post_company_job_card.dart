import 'package:all_in_one3/src/core/routes/app_pages.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/core/widgets/add_container.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_job/post_new_job/controller/post_company_new_job_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostCompanyJob extends GetView<PostCompanyNewJobViewController> {
  const PostCompanyJob({super.key});

  @override
  Widget build(BuildContext context) {
    return AddContainer(
      onTap: () {
        controller.isFromPostEdit.value = false;
        controller.clearTextFields().then((v) {
          Get.toNamed(Routes.postCompanyNewJob);
        });
      },
      title: AppStrings.postNewJob,
    );
  }
}
