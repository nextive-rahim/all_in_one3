import 'package:all_in_one3/src/core/page_state/state.dart';
import 'package:all_in_one3/src/core/widgets/common_tab_section.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/jobs/controller/job_view_controller.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/jobs/widgets/all_jobs_tab.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/jobs/widgets/applied_jobs_tab.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/jobs/widgets/saved_job_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListAndSearchJobStudentMobile extends GetView<JobsViewController> {
  const ListAndSearchJobStudentMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          controller.pageStateController(PageState.loading);
          controller.getjobList().then((v) {
            controller.pageStateController(PageState.success);
          });
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              // top: 30,
            ),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTabSection(
                      title1: 'All jobs',
                      title2: 'Saved jobs',
                      title3: 'Applied jobs',
                      firstTabViewItems: [AllJobsTab()],
                      secondTabViewItems: [SavedJobsTab()],
                      thirdTabViewItems: [AppliedTab()],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
