import 'package:all_in_one3/src/features/company_module/mobile/company_job/post_new_job/controller/post_company_new_job_view_controller.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_job/post_new_job/widget/company_new_job_post_form_field.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_job/post_new_job/widget/post_new_job_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostCompanyNewJobPage extends GetView<PostCompanyNewJobViewController> {
  const PostCompanyNewJobPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leadingWidth: 100,
        // centerTitle: false,
        leading: Row(
          children: [
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Color(0xFF8A8A8A),
                size: 16,
              ),
            ),
            Text(
              'Back',
              style: TextStyle(
                color: Color(0xFF8A8A8A),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 1.50,
              ),
            ),
          ],
        ),
        title: Obx(
          () => Text(
            controller.isFromPostEdit.value ? 'Edit Job' : 'Post new job',
            style: TextStyle(
              color: Color(0xFF262626),
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                controller.isFromPostEdit.value
                    ? 'Edit this job'
                    : 'Post a job',
                style: TextStyle(
                  color: Color(0xFF262626),
                  fontSize: 24,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(right: 20, left: 20, bottom: 70),
                  child: CompanyNewJobPostFormField(),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const PostNewJobButton(),
    );
  }
}
