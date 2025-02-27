import 'package:all_in_one3/src/core/gobal_function.dart';
import 'package:all_in_one3/src/core/page_state/state.dart';
import 'package:all_in_one3/src/core/routes/app_pages.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/assets.dart';
import 'package:all_in_one3/src/core/utils/size_config.dart';
import 'package:all_in_one3/src/core/utils/string.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/core/utils/util.dart';
import 'package:all_in_one3/src/core/widgets/text_widget.dart';
import 'package:all_in_one3/src/features/common_features/user_details/controller/user_details_view_controller.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_job/my_company_jobs/my_company_job_list/controller/company_job_view_controller.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/job_details/widget/company_interview_candidate_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
part '../widget/company_job_candidate_profile_header.dart';
part '../widget/applied_candidate_communication_link.dart';
part '../widget/company_selecte_candidate_for_interview.dart';
part '../widget/company_job_candidate_profile_details.dart';

bool jobAppliedStatus = false;

class CompanyJobAppliedCandidateProfile
    extends GetView<UserDetailsViewController> {
  const CompanyJobAppliedCandidateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    controller.isFrom = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        // centerTitle: false,
        leading: Row(
          children: [
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Color(0xFF8A8A8A),
                size: 16,
              ),
            ),
            Text(
              'Back',
              style: TextStyle(
                color: Color(0xFF8A8A8A),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 1.50,
              ),
            ),
          ],
        ),
        title: Text(
          'Candidate Profile',
          style: TextStyle(
            color: Color(0xFF262626),
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),

      body: Obx(() {
        if (controller.pageState == PageState.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _CompanyJobCandidateProfileHeader(),
                          SizedBox(height: 10),
                          AppliedCandidateCommunicationLink(),
                          SizedBox(height: 10),
                          CompanySelecteCandidateForInterview(),
                          SizedBox(height: 30),
                          CompanyJobCandidateProfileDetails(),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
