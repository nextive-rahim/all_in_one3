import 'package:all_in_one3/src/core/page_state/state.dart';
import 'package:all_in_one3/src/core/widgets/custom_app_bar.dart';
import 'package:all_in_one3/src/core/widgets/empty_screen.dart';
import 'package:all_in_one3/src/features/student_module/mobile/notification/controller/notification_view_controller.dart';
import 'package:all_in_one3/src/features/student_module/mobile/notification/widget/notification_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationViewPage extends StatelessWidget {
  NotificationViewPage({super.key});
  final controller = Get.put(NotificationViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Notification'),
      body: Obx(() {
        if (controller.pageState == PageState.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.notificationList.isEmpty) {
          return const EmptyScreen();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: SingleChildScrollView(
            child: NotificationBuilder(
              notificationModel: controller.notificationList,
            ),
          ),
        );
      }),
    );
  }
}
