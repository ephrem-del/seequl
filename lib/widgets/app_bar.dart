import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/path.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 22.w, right: 42.w, top: 4.h, bottom: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                AppIcons.topImage,
                height: 25.h,
                width: 25.w,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                'SeeQul',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 15.h,
              )
            ],
          ),
          Row(
            children: [
              Image.asset(
                AppIcons.search,
                height: 18.h,
                width: 18.w,
              ),
              SizedBox(
                width: 32.w,
              ),
              Image.asset(
                AppIcons.sort,
                height: 18.h,
                width: 18.w,
              )
            ],
          )
        ],
      ),
    );
  }
}
