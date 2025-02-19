import 'package:all_in_one3/src/core/utils/string.dart';
import 'package:all_in_one3/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/model/employee_model.dart';
import 'package:flutter/material.dart';

class CompanyEmployeeProfileHeader extends StatelessWidget {
  const CompanyEmployeeProfileHeader({super.key, required this.employee});
  final EmployeeModel employee;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 76,
            height: 76,
            decoration: ShapeDecoration(
              color: Color(0xFFE9F2F3),
              shape: OvalBorder(),
            ),

            child:
                employee.image != null
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        employee.image!,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.network(noImageFound);
                        },
                      ),
                    )
                    : Text(
                      getInitials(employee.name ?? ''),
                      style: const TextStyle(
                        color: Color(0xFF5A5959),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
          ),
          SizedBox(height: 10),
          Text(
            employee.name ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color(0xFF262626),
              fontSize: 22,

              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 5),

          Text(
            "Designation : ${employee.degination ?? '-'}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color(0xFF8A8A8A),
              fontSize: 14,

              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "Number : ${employee.phone ?? '-'}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color(0xFF8A8A8A),
              fontSize: 14,

              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "Email : ${employee.username ?? '-'}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color(0xFF8A8A8A),
              fontSize: 14,

              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String getInitials(String name) =>
      name.isNotEmpty
          ? name.trim().split(' ').map((l) => l[0]).take(2).join()
          : '';
}
