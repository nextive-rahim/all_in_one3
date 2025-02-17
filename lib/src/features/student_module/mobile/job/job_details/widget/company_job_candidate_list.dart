import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/core/widgets/text_widget.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_job/my_company_jobs/my_company_job_list/controller/company_job_view_controller.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/job_details/widget/applied_candidate_list_builder.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/job_details/widget/selected_candidate_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyJobInterviewCandidateList
    extends GetView<CompanyJobViewController> {
  const CompanyJobInterviewCandidateList({
    super.key,
    // required this.userDetails,
  });
  // final List<UserDetail>? userDetails;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: CommonColor.greyColor15,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              bottom: 60,
              top: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  textAlign: TextAlign.center,
                  text:
                      'Total Applied : ${controller.appliedCandidateList?.length}',
                  color: CommonColor.blackColor1,
                  maxLine: 1,
                  fontFamily: AppStrings.sfProDisplay,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                const SizedBox(height: 20),
                const TextWidget(
                  textAlign: TextAlign.center,
                  text: AppStrings.appliedProfiles,
                  color: CommonColor.blackColor2,
                  maxLine: 1,
                  fontFamily: AppStrings.sfProDisplay,
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
                const SizedBox(height: 15),
                const AppliedCandidateListBuilder(),
                const SizedBox(height: 40),
                const TextWidget(
                  textAlign: TextAlign.center,
                  text: AppStrings.selectedProfiles,
                  color: CommonColor.blackColor2,
                  maxLine: 1,
                  fontFamily: AppStrings.sfProDisplay,
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
                const SizedBox(height: 15),
                const SelectedCandidateListBuilder(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
