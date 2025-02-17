import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onTap,
    this.isLoading = false,
    this.widget,
    this.backgroundColor,
    this.title,
  });

  final Function onTap;
  final bool isLoading;
  final Widget? widget;
  final Color? backgroundColor;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor ?? CommonColor.purpleColor1,
        border: Border.all(color: Color(0xFFCFD4DC)),
        // gradient: const LinearGradient(
        //   colors: [
        //     CommonColor.purpleColor1,
        //     CommonColor.purpleColor1,
        //   ],
        //   begin: Alignment.centerLeft,
        //   end: Alignment.centerRight,
        // ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        onPressed: isLoading ? null : () => onTap(),
        child:
            isLoading
                ? Center(
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      backgroundColor: Colors.white,
                    ),
                  ),
                )
                : widget ??
                    Text(
                      title ?? '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        // height: 1.56,
                      ),
                    ),
      ),
    );
  }
}
