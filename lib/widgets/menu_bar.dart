import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/path.dart';

showMenuBar({required BuildContext context, }) {
    showMenu(
        context: context,
        position: RelativeRect.fromLTRB(-30, 52, 279.w, 449.h),
        items: [
          PopupMenuItem(
            child: Row(
              children: [
                Image.asset(
                  AppIcons.addPost,
                  height: 25.h,
                ),
                SizedBox(
                  width: 13.w,
                ),
                const Text('Post a seequl'),
              ],
            ),
          ),
          PopupMenuItem(
            child: Row(
              children: [
                Image.asset(
                  AppIcons.heartRed,
                  height: 25.h,
                ),
                SizedBox(
                  width: 13.w,
                ),
                const Text('View your likes'),
              ],
            ),
          ),
          PopupMenuItem(
            child: Row(
              children: [
                Image.asset(
                  AppIcons.sequel,
                  height: 25.h,
                ),
                SizedBox(
                  width: 13.w,
                ),
                const Text('Your seequl posts'),
              ],
            ),
          ),
          PopupMenuItem(
            child: Row(
              children: [
                Image.asset(
                  AppIcons.reference,
                  height: 25.h,
                ),
                SizedBox(
                  width: 13.w,
                ),
                const Text('Reference contribution'),
              ],
            ),
          ),
          PopupMenuItem(
            child: Row(
              children: [
                Image.asset(
                  AppIcons.hashtags,
                  height: 25.h,
                ),
                SizedBox(
                  width: 13.w,
                ),
                const Text('Hashtag challenges'),
              ],
            ),
          ),
          PopupMenuItem(
            child: Row(
              children: [
                Image.asset(
                  AppIcons.notifications,
                  height: 25.h,
                ),
                SizedBox(
                  width: 13.w,
                ),
                const Text('Notifications'),
              ],
            ),
          ),
          PopupMenuItem(
            child: Row(
              children: [
                Image.asset(
                  AppIcons.info,
                  height: 25.h,
                ),
                SizedBox(
                  width: 13.w,
                ),
                const Text('About SeeQul'),
              ],
            ),
          ),
        ],);
  }