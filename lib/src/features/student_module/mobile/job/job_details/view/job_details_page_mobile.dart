import 'package:all_in_one3/src/core/extension/sizebox_extension.dart';
import 'package:all_in_one3/src/features/common_features/user_details/controller/user_details_view_controller.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_job/my_company_jobs/my_company_job_list/controller/company_job_view_controller.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/job_details/widget/company_job_apply_button.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/job_details/widget/company_save_job_button_from_job_details.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/job_details/widget/company_job_candidate_list.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/job_details/widget/apply_job_button.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/job_details/widget/job_description.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/job_details/widget/job_details_header.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/job_details/widget/job_summary_card.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/job_details/widget/save_job_button_from_job_details.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum JobIsFrom { all, applied, saved, company, other }

class JobDetailsPageMobile extends StatefulWidget {
  const JobDetailsPageMobile({super.key});

  @override
  State<JobDetailsPageMobile> createState() => _JobDetailsPageMobileState();
}

class _JobDetailsPageMobileState extends State<JobDetailsPageMobile> {
  final companyjobController = Get.put(CompanyJobViewController());
  final profileController = Get.put(UserDetailsViewController());
  final JobModel viewJobResponseData = Get.arguments[0];
  final isFromCompanyJob = Get.arguments[1] == JobIsFrom.company ? true : false;

  final bool isFromOtherJob =
      Get.arguments[1] == JobIsFrom.other ? true : false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    companyjobController.appliedCandidateList?.value =
        viewJobResponseData.user ?? [];
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
          'Job details',
          style: TextStyle(
            color: Color(0xFF262626),
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: JobDetailsHeader(job: viewJobResponseData),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: JobSummaryCard(job: viewJobResponseData),
            ),

            isFromOtherJob
                ? Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Column(
                    children: [
                      CompanySaveJobButtonFromJobDetails(
                        job: viewJobResponseData,
                      ),
                      10.sh,
                      CompanyJobApplyButton(job: viewJobResponseData),
                    ],
                  ),
                )
                : isFromCompanyJob
                ? const Offstage()
                : Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16,),
                  child: Column(
                    children: [
                      SaveJobButtonFromJobDetails(job: viewJobResponseData),
                      10.sh,
                      ApplyJobButton(job: viewJobResponseData),
                    ],
                  ),
                ),
            20.sh,
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: JobDescription(job: viewJobResponseData),
            ),
            //  const JobShareButton(),
            isFromCompanyJob
                ? const CompanyJobInterviewCandidateList(
                  // userDetails: viewJobResponseData.user
                )
                : const Offstage(),
          ],
        ),
      ),
    );
  }
}
