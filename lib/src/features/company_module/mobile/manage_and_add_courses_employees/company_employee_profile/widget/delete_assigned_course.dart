import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/util.dart';
import 'package:all_in_one3/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/controller/employee_view_controller.dart';
import 'package:all_in_one3/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeletedAssignCourse extends GetView<CompanyEmployeeListViewController> {
  const DeletedAssignCourse({
    super.key,
    required this.course,
  });
  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          _showDailogBox(context);
        },
        icon: const Icon(
          Icons.delete_forever,
          color: CommonColor.redColors,
        ));
  }

  void _showDailogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Do you want delete this job?'),
          content: const SingleChildScrollView(
            child: SelectableText('Delete is irreversible.'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                controller
                    .deleteAssingCourse(
                        course.id!, controller.employeeModel!.userId!)
                    .then((v) {
                  controller.assignedCouseList
                      .removeWhere((v) => v.id == course.id);
                  Get.back();
                  SnackBarService.showInfoSnackBar('Successfully delete job.');
                });
              },
              child: const Text(
                'OK',
                style: TextStyle(color: CommonColor.redColors),
              ),
            )
          ],
        );
      },
    );
  }
}
