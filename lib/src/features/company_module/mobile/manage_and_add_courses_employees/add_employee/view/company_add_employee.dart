import 'package:all_in_one3/src/core/theme/text_style.dart';
import 'package:all_in_one3/src/core/widgets/custom_app_bar.dart';
import 'package:all_in_one3/src/features/company_module/mobile/manage_and_add_courses_employees/add_employee/widget/add_employee_form.dart';
import 'package:all_in_one3/src/features/company_module/mobile/manage_and_add_courses_employees/add_employee/widget/add_new_employee_button.dart';
import 'package:all_in_one3/src/features/company_module/mobile/manage_and_add_courses_employees/add_employee/widget/added_employee_image_by_company.dart';
import 'package:flutter/material.dart';

class CompanyAddEmployeePageMobile extends StatefulWidget {
  const CompanyAddEmployeePageMobile({super.key});

  @override
  State<CompanyAddEmployeePageMobile> createState() =>
      _CompanyAddEmployeePageMobileState();
}

class _CompanyAddEmployeePageMobileState
    extends State<CompanyAddEmployeePageMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(title: ''),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Added New Employee :',
              style: TextStyle(
                color: Color(0xFF262626),
                fontSize: 24,

                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: 326,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFE9F2F3),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AddedEployeeImageByCompany(),
                    AddedNewEmployeeFormField(),
                    //  _AddedCoursesForEmployee()
                    SizedBox(height: 70),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AddedNewEmployeeButton(),
    );
  }
}
