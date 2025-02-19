import 'package:all_in_one3/src/core/utils/assets.dart';
import 'package:flutter/material.dart';

class AddContainer extends StatelessWidget {
  const AddContainer({super.key,required this.onTap,this.width,required this.title,this.bottom});
final void Function()? onTap;
final double? width;
final double? bottom;
final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
      onTap,
       
      child: Padding(
        padding:  EdgeInsets.only(bottom:bottom?? 20),
        child: Container(
          width:width?? double.infinity,
          height: 36,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFFCFD4DC)),
              borderRadius: BorderRadius.circular(8),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x0C101828),
                blurRadius: 2,
                offset: Offset(0, 1),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 20,
                height: 20,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: Image.asset(Assets.add),
              ),
              SizedBox(width: 8),
              Text(
               title,
                style: TextStyle(
                  color: Color(0xFF262626),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 1.43,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}