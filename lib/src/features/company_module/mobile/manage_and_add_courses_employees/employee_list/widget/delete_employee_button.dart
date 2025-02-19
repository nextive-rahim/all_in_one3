import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/assets.dart';
import 'package:all_in_one3/src/core/utils/util.dart';
import 'package:all_in_one3/src/core/widgets/delete_dailog.dart';
import 'package:all_in_one3/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/controller/employee_view_controller.dart';
import 'package:all_in_one3/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/model/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteEmployeeButton extends GetView<CompanyEmployeeListViewController> {
  const DeleteEmployeeButton({super.key, required this.employee});
  final EmployeeModel employee;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        deleteDailog(
          context: context,
          title: 'Do you want to delete this employee.',
          message: 'Deleted employee is irreversible.',
          onTap: () {
            controller.deleteEmployee(employee.userId ?? 0).then((v) {
              if (v.success == true) {
                controller.employeeList.removeWhere((v) => v.id == employee.id);
              } else {
                SnackBarService.showErrorSnackBar(v.message ?? '');
              }
            });
            Navigator.of(context).pop();
          },
        );
      },
      child: Image.asset(Assets.trash, height: 24, width: 24),
    );
  }
}
