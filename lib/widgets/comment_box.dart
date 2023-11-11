import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/path.dart';

class CommentBox extends StatelessWidget {
  const CommentBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset(AppAssets.user6, height: 49.h,),
      SizedBox(width: 12.w,),
      Container(
        height: 54.h,
        padding: EdgeInsets.only(left: 12.w, right: 18.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(34.r),
          border: Border.all(color: Color(0xffC4C4C4))
        ),
        child: Row(
          children: [
            Image.asset(AppIcons.emoji, height: 27.h,),
            SizedBox(width: 14.w),
            SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Add comment',
                  hintStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500,)
                ),
              ),
            ),
            Image.asset(AppIcons.send, height: 24.h),
          ],
        )
      )
    ],);
  }
}