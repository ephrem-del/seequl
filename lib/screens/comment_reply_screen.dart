import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_ephrem/config/path.dart';
import 'package:test_ephrem/widgets/app_bar.dart';
import 'package:test_ephrem/widgets/comment_box.dart';
import 'package:test_ephrem/widgets/comment_widget.dart';

import '../models/comment.dart';

class CommentReplyScreen extends StatefulWidget {
  final XComment comment;
  const CommentReplyScreen({super.key, required this.comment});

  @override
  State<CommentReplyScreen> createState() => _CommentReplyScreenState();
}

class _CommentReplyScreenState extends State<CommentReplyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            children: [
              AppBarWidget(),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        AppIcons.back,
                        height: 25.h,
                      )),
                  SizedBox(
                    width: 13.w,
                  ),
                  Text(
                    'Reply',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff4B4B4B)),
                  ),
                ],
              ),
              SizedBox(
                height: 41.h,
              ),
              CommentWidget(
                comment: widget.comment,
                isReplying: true,
              ),
              CommentBox(),
            ],
          ),
        ),
      ),
    );
  }
}
