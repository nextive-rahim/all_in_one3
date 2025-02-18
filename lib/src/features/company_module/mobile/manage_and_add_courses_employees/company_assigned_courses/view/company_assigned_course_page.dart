import 'package:all_in_one3/src/core/page_state/state.dart';
import 'package:all_in_one3/src/core/theme/colors.dart';
import 'package:all_in_one3/src/core/theme/text_style.dart';
import 'package:all_in_one3/src/core/widgets/custom_app_bar.dart';
import 'package:all_in_one3/src/features/company_module/mobile/manage_and_add_courses_employees/company_assigned_courses/widget/company_assigned_course_builder.dart';
import 'package:all_in_one3/src/features/company_module/mobile/manage_and_add_courses_employees/company_assigned_courses/widget/company_assigned_course_button.dart';
import 'package:all_in_one3/src/features/student_module/mobile/course/home_course/controller/student_home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyAssignedCourses extends GetView<StudentHomeViewController> {
  const CompanyAssignedCourses({super.key});

  @override
  Widget build(BuildContext context) {
    controller.employeeModel = Get.arguments;
    return Scaffold(
      appBar: CustomAppBar(title: 'Assigned courses'),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getStudentHomeData();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Assigned courses for employee',
                style: AppTextStyle.bold20.copyWith(
                  color: AppColors.lightBlack80,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Obx(() {
                  if (controller.pageState == PageState.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return const SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: CompanyAssigniedCourseBuilder(),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CompanyAssignedCourseButton(
        employee: controller.employeeModel!,
      ),
    );
  }
}
