import 'package:all_in_one3/src/core/extension/sizebox_extension.dart';
import 'package:all_in_one3/src/core/extension/string_extension.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/features/student_module/mobile/notification/model/notification_model.dart';
import 'package:flutter/widgets.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.notificationModel});
  final NotificationModel? notificationModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
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
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(notificationModel?.text ?? ''),
              10.sh,
              Text(
                getFormattedDateTime(notificationModel?.createdAt) ?? '',
                style: const TextStyle(color: CommonColor.purpleColor1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
