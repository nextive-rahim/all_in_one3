import 'package:all_in_one3/src/core/gobal_function.dart';
import 'package:all_in_one3/src/core/utils/assets.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/core/widgets/add_container.dart';
import 'package:all_in_one3/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/model/employee_model.dart';
import 'package:flutter/material.dart';

class CompanyEmployeeProfileContactSection extends StatelessWidget {
  const CompanyEmployeeProfileContactSection({
    super.key,
    required this.employee,
  });
  final EmployeeModel employee;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddContainer(
          height: 44,
          icon: Assets.send1,
          onTap: () {
            hotlineSupport(employee.phone ?? '');
          },
          title: AppStrings.call,
        ),
        AddContainer(
          height: 44,
          icon: Assets.send2,
          onTap: () {
            emailSupport(employee.username ?? '');
          },
          title: AppStrings.call,
        ),
      ],
    );
  }
}
