import 'package:all_in_one3/src/features/interviewer_module/mobile/interviews/interviewer_payment/controller/interviewer_payment_view_controller.dart';
import 'package:all_in_one3/src/features/interviewer_module/mobile/interviews/interviewer_payment/widgets/interviewer_payment_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterviewerPaymentBuilder
    extends GetView<InterviewerPaymentViewController> {
  const InterviewerPaymentBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        itemCount: controller.allPayments.length,
        shrinkWrap: true,
        reverse: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InterviewerPaymentCard(
            paymentModel: controller.allPayments[index],
          );
        },
      );
    });
  }
}
