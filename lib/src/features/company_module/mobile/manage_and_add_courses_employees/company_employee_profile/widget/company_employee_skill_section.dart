import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/core/widgets/text_widget.dart';
import 'package:all_in_one3/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/model/employee_model.dart';
import 'package:flutter/material.dart';

class CompanyEmployeeSkillSection extends StatefulWidget {
  const CompanyEmployeeSkillSection({super.key, required this.user});
  final EmployeeModel? user;
  @override
  State<CompanyEmployeeSkillSection> createState() =>
      _CompanyEmployeeSkillSectionState();
}

class _CompanyEmployeeSkillSectionState
    extends State<CompanyEmployeeSkillSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        const Text(
          'Top skills',
          style: TextStyle(
            color: Color(0xFF262626),
            fontSize: 18,

            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        widget.user!.userSkill == null
            ? Offstage()
            : Wrap(
              direction: Axis.horizontal,
              spacing: 20.0,
              runSpacing: 20.0,
              children: [
                for (int i = 0; i < widget.user!.userSkill!.length; i++)
                  Container(
                    height: 40,
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 10,
                    ),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 0.50,
                          color: CommonColor.greyColor5,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: CommonColor.blackColor3,
                          blurRadius: 2,
                          offset: Offset(0, 1),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: TextWidget(
                      textAlign: TextAlign.center,
                      text: widget.user?.userSkill![i].skill ?? '',
                      color: CommonColor.blackColor2,
                      maxLine: 1,
                      fontFamily: AppStrings.inter,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
              ],
            ),

        // GridView.builder(
        //   padding: const EdgeInsets.only(bottom: 10),
        //   shrinkWrap: true,
        //   itemCount: widget.user?.userSkill!.length,
        //   physics: const NeverScrollableScrollPhysics(),
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2, // number of items in each row
        //     mainAxisSpacing: 8.0, // spacing between rows
        //     crossAxisSpacing: 8.0,
        //     mainAxisExtent: 50, // spacing between columns
        //   ),
        //   itemBuilder: (context, index) {
        //     return TextWidget(
        //       text:
        //           "${index + 1} . ${widget.user?.userSkill![index].skill ?? ''}",
        //       color: CommonColor.blackColor2,
        //       maxLine: 2,
        //       fontFamily: AppStrings.inter,
        //       fontWeight: FontWeight.w500,
        //       fontSize: 16,
        //     );
        //   },
        // ),
      ],
    );
  }
}
