import 'package:all_in_one3/src/core/routes/app_pages.dart';
import 'package:all_in_one3/src/core/widgets/add_container.dart';
import 'package:all_in_one3/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/controller/employee_view_controller.dart';
import 'package:all_in_one3/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/widget/employee_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyEmployeeListPageMobile extends StatelessWidget {
  const CompanyEmployeeListPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CompanyEmployeeListViewController());
    return Scaffold(
      //  backgroundColor: CommonColor.greyColor1,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            controller.getEmployeeList();
          },
          child: Column(
            children: [
              // StudentAppBarMobile(
              //   titel1: AppStrings.companyName,
              //   title2: "Company Tagline here",
              //   isBack: false,
              //   searchHintText: "Search for employees, departments and more...",
              //   onSearchListener: (value) {},
              //   isShowNotificationIcon: false,
              // ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const SizedBox(height: 17),
                            // const EmployeeListFilterSection(),
                            const SizedBox(height: 14),
                            AddContainer(
                              onTap: () {
                                Get.toNamed(
                                  Routes.companyAddEmployeePageMobile,
                                );
                              },
                              title: 'Add New Employee',
                            ),

                            const EmployeeListSection(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
