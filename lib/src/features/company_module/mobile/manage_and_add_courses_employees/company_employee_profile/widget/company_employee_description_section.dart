import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/model/employee_model.dart';
import 'package:flutter/material.dart';

class CompanyEmployeeProfileDescriptionSection extends StatelessWidget {
  const CompanyEmployeeProfileDescriptionSection({
    super.key,
    required this.employee,
  });
  final EmployeeModel employee;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${AppStrings.employeeID} ${employee.id}",
          style: TextStyle(
            color: Color(0xFF262626),
            fontSize: 18,

            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          AppStrings.employeeDescription,
          style: TextStyle(
            color: Color(0xFF262626),
            fontSize: 18,

            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          employee.descripton ?? '',
          style: TextStyle(
            color: Color(0xFF8A8A8A),
            fontSize: 16,

            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
