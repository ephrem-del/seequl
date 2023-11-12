import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/path.dart';

class CommentBox extends StatelessWidget {
  final TextEditingController commentTextController;
  final void Function() onEmojiTapped;
  final FocusNode focusNode;
  const CommentBox({
    super.key,
    required this.commentTextController,
    required this.onEmojiTapped,
    required this.focusNode
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppAssets.user6,
          height: 49.h,
        ),
        SizedBox(
          width: 12.w,
        ),
        Container(
            height: 54.h,
            padding: EdgeInsets.only(left: 12.w, right: 18.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34.r),
                border: Border.all(color: const Color(0xffC4C4C4))),
            child: Row(
              children: [
                InkWell(
                  onTap: onEmojiTapped,
                  child: Image.asset(
                    AppIcons.emoji,
                    height: 27.h,
                  ),
                ),
                SizedBox(width: 14.w),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    focusNode: focusNode,
                    controller: commentTextController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Add comment',
                        hintStyle: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
                Image.asset(AppIcons.send, height: 24.h),
              ],
            ))
      ],
    );
  }
}
