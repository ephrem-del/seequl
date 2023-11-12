import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_ephrem/config/path.dart';
import 'package:test_ephrem/screens/comment_reply_screen.dart';

import '../models/comment.dart';

class CommentWidget extends StatelessWidget {
  final XComment comment;
  final bool isReplying;
  const CommentWidget({
    super.key,
    required this.comment,
    this.isReplying = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isReplying ? 10.h : 26.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            comment.image,
            height: 44.h,
          ),
          SizedBox(
            width: 12.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    comment.name,
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    comment.userName,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff5C8DFF)),
                  ),
                  SizedBox(
                    width: 54.w,
                  ),
                  Text(
                    comment.time,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffC4C4C4)),
                  ),
                ],
              ),
              SizedBox(
                height: 7.h,
              ),
              SizedBox(
                  width: 307.w,
                  child: Text(
                    comment.body,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff767676)),
                  )),
              !isReplying ? SizedBox(
                height: 12.h,
              ) : const SizedBox.shrink(),
              isReplying
                  ? const SizedBox.shrink()
                  : SizedBox(
                      width: 125.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => CommentReplyScreen(
                                          comment: comment)));
                                },
                                child: Image.asset(
                                  AppIcons.comment,
                                  height: 22.h,
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              comment.comments != 0
                                  ? Text(
                                      comment.comments.toString(),
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w300,
                                        color: const Color(
                                          0xffC4C4C4,
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                AppIcons.heartOutline,
                                height: 22.h,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(comment.likes,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w300,
                                    color: const Color(
                                      0xffC4C4C4,
                                    ),
                                  ))
                            ],
                          ),
                          Image.asset(
                            AppIcons.flag,
                            height: 22.h,
                          )
                        ],
                      ),
                    ),
              isReplying
                  ? const SizedBox.shrink()
                  : comment.comments != 0
                      ? Container(
                          margin: EdgeInsets.only(top: 10.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 3.h),
                          decoration: BoxDecoration(
                            color: const Color(0xffFEF1F1),
                            borderRadius: BorderRadius.circular(3.r),
                          ),
                          child: Row(
                            children: [
                              Text('View ${comment.comments} replies'),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                              ),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
            ],
          )
        ],
      ),
    );
  }
}
