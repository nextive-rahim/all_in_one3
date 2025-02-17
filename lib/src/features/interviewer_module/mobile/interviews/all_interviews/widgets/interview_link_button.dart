part of '../view/all_interview_section_mobile.dart';

class InterviewLinkButton extends GetView<AllInterviewsViewController> {
  const InterviewLinkButton({
    super.key,
    required this.interview,
  });
  final ViewInterviewResponseData interview;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (interview.remainingDayForFormFillUp != 'Available Now') {
          Util.displayErrorToast(
            context,
            'Interview is not avaiable yet',
          );
          return;
        }
        if (!interview.interviewLink!.contains('https://')) {
          Util.displayErrorToast(
            context,
            'Please enter a vaild meeting link',
          );
          return;
        }
        await urlLauncher(interview.interviewLink ?? '').then((v) {
          controller.completeInterviewRequest(interview.id!).then((v2) {
            controller.getAllInterviews();
          });
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Row(
          children: [
            Image.asset(
              ImageConstant.link2,
              color: CommonColor.blueColor1,
              height: 15,
              width: 15,
            ),
            const SizedBox(width: 8),
            const TextWidget(
              text: AppStrings.interviewLink,
              color: CommonColor.blueColor1,
              maxLine: 1,
              fontFamily: AppStrings.sfProDisplay,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ],
        ),
      ),
    );
  }
}
