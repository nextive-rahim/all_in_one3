import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/formated_date_time.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/core/widgets/text_widget.dart';
import 'package:all_in_one3/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one3/src/features/student_module/mobile/course/course_details/comment/controller/view_reply_view_controller.dart';
import 'package:all_in_one3/src/features/student_module/mobile/course/course_details/comment/model/student_view_comment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ReplyCard extends StatefulWidget {
  const ReplyCard({
    super.key,
    required this.comment,
  });
  final ViewCommentResponseData comment;
  @override
  State<ReplyCard> createState() => _ReplyCardState();
}

bool isShowReplyForm = false;

class _ReplyCardState extends State<ReplyCard> {
  final replyController = Get.find<ViewReplyViewController>();
  final profileController = Get.find<ProfileViewController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(profileController.userModel?.image ?? '')

                //  AppCachedNetworkImage(
                //   imageUrl: profileController.userModel?.image,
                //   cachedHeight: 131,
                //   cachedWidth: 131,
                // ),
                ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: widget.comment.name ?? '',
                color: CommonColor.headingTextColor1,
                maxLine: 1,
                fontFamily: AppStrings.sfProDisplay,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              TextWidget(
                text:
                    '${FormatedDateTime.formatedDateTime1(widget.comment.updatedAt.toString(), inputFormat: 'yyyy-MM-dd', outputFormat: 'yMd')}, at ${FormatedDateTime.formatedTime(widget.comment.updatedAt.toString())}', //'Yesterday at 6:24 PM',
                color: CommonColor.greyColor10,
                maxLine: 1,
                fontFamily: AppStrings.sfProDisplay,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
              const SizedBox(height: 10),
              TextWidget(
                text: widget.comment.replyText ?? '',
                // "Hello there! It's great to hear that you're interested in a React dev course. React is a popular and widely used JavaScript library for building user interfaces. With React, you can create interactive and dynamic web applications that are responsive and easy to maintain.",
                color: CommonColor.headingTextColor1,
                maxLine: 5,
                fontFamily: AppStrings.sfProDisplay,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
