import 'package:all_in_one3/src/core/theme/colors.dart';
import 'package:all_in_one3/src/core/utils/assets.dart';
import 'package:all_in_one3/src/core/utils/util.dart';
import 'package:all_in_one3/src/core/widgets/delete_dailog.dart';
import 'package:all_in_one3/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/controller/employee_view_controller.dart';
import 'package:all_in_one3/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeletedAssignCourse extends GetView<CompanyEmployeeListViewController> {
  const DeletedAssignCourse({super.key, required this.course});
  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        deleteDailog(
          context: context,
          message: 'Delete is irreversible.',
          onTap: () {
            controller
                .deleteAssingCourse(
                  course.id!,
                  controller.employeeModel!.userId!,
                )
                .then((v) {
                  controller.assignedCouseList.removeWhere(
                    (v) => v.id == course.id,
                  );
                  Get.back();
                  SnackBarService.showInfoSnackBar(
                    'Successfully delete course.',
                  );
                });
          },
          title: 'Do you want delete this course?',
        );
      },
      icon: Image.asset(
        Assets.trash,
        height: 24,
        width: 24,
        color: AppColors.red,
      ),
    );
  }
}
