import 'package:all_in_one3/src/core/routes/app_pages.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/formated_date_time.dart';
import 'package:all_in_one3/src/core/utils/assets.dart';
import 'package:all_in_one3/src/core/utils/size_config.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/core/widgets/text_widget.dart';
import 'package:all_in_one3/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_job/my_company_jobs/my_company_job_list/controller/company_job_view_controller.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_job/my_company_jobs/my_company_job_list/widget/delete_company_job.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_job/my_company_jobs/my_company_job_list/widget/edit_job_icon.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/job_details/view/job_details_page_mobile.dart';
import 'package:all_in_one3/src/features/student_module/mobile/job/jobs/model/view_job_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyJobCard extends StatelessWidget {
  const CompanyJobCard({super.key, required this.job});
  final JobModel job;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CommonColor.whiteColor,
        boxShadow: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 80,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          top: 25,
          right: 20,
          bottom: 25,
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.put(CompanyJobViewController()).companyJonID = job.id;
                Get.toNamed(
                  Routes.jobDetails,
                  arguments: [job, JobIsFrom.company],
                );
              },
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          job.jobRole ?? '',
                          style: TextStyle(
                            color: Color(0xFF363636),
                            fontSize: 18,

                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 7),
                        Text(
                          textAlign: TextAlign.center,

                          Get.find<ProfileViewController>().userModel?.name ??
                              '',
                          style: TextStyle(
                            color: Color(0xFF8A8A8A),
                            fontSize: 14,

                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            Image.asset(
                              Assets.jobLogo,
                              // color: CommonColor.purpleColor1,
                              height: 18,
                              width: 18,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              textAlign: TextAlign.center,
                              '${job.workExpMin}-${job.workExpMax}',
                              style: TextStyle(
                                color: Color(0xFF5A5959),
                                fontSize: 13.50,

                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Image.asset(
                              Assets.payment,

                              height: 18,
                              width: 18,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              textAlign: TextAlign.center,
                              '${job.paysalary}/ yr',
                              style: TextStyle(
                                color: Color(0xFF5A5959),
                                fontSize: 13.50,

                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Image.asset(
                              Assets.send2,

                              height: 18,
                              width: 18,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              textAlign: TextAlign.center,
                              job.workLocation ?? '',
                              style: TextStyle(
                                color: Color(0xFF5A5959),
                                fontSize: 13.50,

                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              Assets.file,

                              height: 18,
                              width: 18,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                job.jobDescription ?? '',
                                style: TextStyle(
                                  color: Color(0xFF5A5959),
                                  fontSize: 13.50,

                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              textAlign: TextAlign.start,
                              text:
                                  "Posted ${FormatedDateTime.readTimestamp(int.parse(job.time ?? "0"))}",
                              color: CommonColor.greyColor12,
                              maxLine: 1,
                              fontFamily: AppStrings.sfProDisplay,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                EditJobIcon(job: job),
                const SizedBox(width: 20),
                DeletedCompanyJob(job: job),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
