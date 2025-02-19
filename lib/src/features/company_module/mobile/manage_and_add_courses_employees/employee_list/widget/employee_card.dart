import 'package:all_in_one3/src/core/gobal_function.dart';
import 'package:all_in_one3/src/core/routes/app_pages.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/assets.dart';
import 'package:all_in_one3/src/core/utils/size_config.dart';
import 'package:all_in_one3/src/core/utils/string.dart';
import 'package:all_in_one3/src/core/widgets/add_container.dart';
import 'package:all_in_one3/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/model/employee_model.dart';
import 'package:all_in_one3/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/widget/delete_employee_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({super.key, required this.employee});
  final EmployeeModel employee;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.companyEmployeeProfilePage, arguments: employee);
      },
      child: Container(
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: CommonColor.boxShadow,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(
                    Routes.companyEmployeeProfilePage,
                    arguments: employee,
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 52,
                            height: 52,
                            alignment: Alignment.center,
                            decoration: const ShapeDecoration(
                              color: Color(0xFFECECEC),
                              shape: CircleBorder(),
                            ),
                            child:
                                employee.image != null
                                    ? ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(
                                        employee.image!,
                                        fit: BoxFit.fill,
                                        width: double.infinity,
                                        errorBuilder: (
                                          context,
                                          error,
                                          stackTrace,
                                        ) {
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
                          const SizedBox(width: 21),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  employee.name ?? '',
                                  style: const TextStyle(
                                    color: Color(0xFF262626),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  employee.degination ?? '',
                                  style: const TextStyle(
                                    color: Color(0xFF262626),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  employee.descripton ?? '',
                                  maxLines: 2,
                                  style: const TextStyle(
                                    color: Color(0xFF8A8A8A),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    DeleteEmployeeButton(employee: employee),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: SizeConfig.screenWidth,
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.50,
                      //  strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFD9D9D9),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          hotlineSupport(employee.phone ?? '');
                        },
                        child: Image.asset(
                          Assets.send1,
                          height: 24,
                          width: 24,
                          color: CommonColor.blackColor1.withValues(alpha: .6),
                        ),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          emailSupport(employee.username ?? '');
                        },
                        child: Image.asset(
                          Assets.mail,
                          height: 24,
                          width: 24,
                          color: CommonColor.blackColor1.withValues(alpha: .6),
                        ),
                      ),
                    ],
                  ),
                  AddContainer(
                    width: 161,
                    bottom: 0,
                    onTap: () {
                      Get.toNamed(
                        Routes.companyAssignedCourses,
                        arguments: employee,
                      );
                    },
                    title: 'Assign Course',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getInitials(String name) =>
      name.isNotEmpty
          ? name.trim().split(' ').map((l) => l[0]).take(2).join()
          : '';
}
