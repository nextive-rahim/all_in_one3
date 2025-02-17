import 'package:all_in_one3/src/core/page_state/state.dart';
import 'package:all_in_one3/src/core/routes/app_pages.dart';
import 'package:all_in_one3/src/core/widgets/empty_screen.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_job/other_jobs/controller/other_company_job_view_controller.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_job/other_jobs/widgets/other_company_job_card.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/job_details/view/job_details_page_mobile.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/jobs/widgets/job-card_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyAppliedJobTab extends GetView<OtherCompanyJobsViewController> {
  const CompanyAppliedJobTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: RefreshIndicator(
        onRefresh: () async {
          controller.getOtherCompanyjobList();
        },
        child: Obx(
          () {
            if (controller.pageState == PageState.loading) {
              return const JobCardLoading();
            }
            return controller.companyAppiedJobList.isEmpty
                ? const EmptyScreen()
                : ListView.separated(
                    itemCount: controller.companyAppiedJobList.length,
                    shrinkWrap: true,
                    reverse: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                    itemBuilder: (context, index) {
                      return OtherCompanyJobCard(
                        onTap: () {
                          Get.toNamed(
                            Routes.jobDetails,
                            arguments: [
                              controller.companyAppiedJobList[index],
                              JobIsFrom.applied
                            ],
                          );
                        },
                        isFromAppliedJob: true,
                        job: controller.companyAppiedJobList[index],
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
