part of '../view/all_interview_section_mobile.dart';

class InterViewCard extends StatelessWidget {
  const InterViewCard({
    super.key,
    required this.index,
    required this.interview,
    this.isFormRequestsInterviews = false,
    this.isFormConfirmInterviews = false,
    this.isFormCompletedInterviews = false,
    this.isExpaired = false,
  });
  final int index;
  final ViewInterviewResponseData interview;
  final bool isFormRequestsInterviews;
  final bool isFormConfirmInterviews;
  final bool isFormCompletedInterviews;
  final bool isExpaired;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () async {
            if (isExpaired && isFormRequestsInterviews) {
              Util.displayErrorToast(context, 'Acceptance timed out');
              return;
            }
            isFormRequestsInterviews
                ? Get.toNamed(
                  Routes.selecteInterviewFormConfirmation,
                  arguments: interview,
                )
                : null;
          },
          child: Container(
            width: SizeConfig.screenWidth,
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
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    interview.title ?? '',
                    style: TextStyle(
                      color: Color(0xFF262626),
                      fontSize: 18,

                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      interview.status == 1
                          ? Text(
                            '(${interview.timeSlotA ?? ''} , ${interview.timeSlotB})',
                            style: TextStyle(
                              color: Color(0xFF262626),
                              fontSize: 14,

                              fontWeight: FontWeight.w700,
                            ),
                          )
                          : Text(
                            interview.approvedSlotA == 1
                                ? interview.timeSlotA.toString()
                                : interview.timeSlotB.toString(),
                            style: TextStyle(
                              color: Color(0xFF262626),
                              fontSize: 14,

                              fontWeight: FontWeight.w700,
                            ),
                          ),
                      const SizedBox(width: 10),
                      Text(
                        getFormattedDate(interview.date) ?? '',
                        style: TextStyle(
                          color: Color(0xFF262626),
                          fontSize: 14,

                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  isFormCompletedInterviews
                      ? InterviewFeedbackCard(interview: interview)
                      : const Offstage(),
                  isFormConfirmInterviews
                      ? InterviewLinkButton(interview: interview)
                      : const Offstage(),
                  const SizedBox(height: 5),
                  isExpaired && isFormRequestsInterviews
                      ? const Text(
                        'Expaired',
                        style: TextStyle(
                          color: Color(0xFFB3261E),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      )
                      : const Offstage(),
                  !isExpaired && isFormConfirmInterviews
                      ? Text(
                        interview.remainingDayForFormFillUp,
                        style: TextStyle(
                          color:
                              interview.remainingDayForFormFillUp ==
                                      'Available Now'
                                  ? CommonColor.greenColor1
                                  : CommonColor.redColors,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
