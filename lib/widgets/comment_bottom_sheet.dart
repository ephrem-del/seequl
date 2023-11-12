import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_ephrem/models/comment.dart';

import 'comment_box.dart';
import 'comment_widget.dart';
import 'emoji_keyboard.dart';

commentBottomSheet({ required BuildContext context,required  List<XComment> comments, required TextEditingController commentTextController,}) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.r),
                      topRight: Radius.circular(25.r),
                    ),
                    color: Colors.white),
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 14.w),
                      decoration: BoxDecoration(
                        color: const Color(0xff5F6368),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5.r),
                          bottomRight: Radius.circular(5.r),
                        ),
                      ),
                      child: const Text(
                        '45k comments',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 21.w, right: 30.w),
                        child: ListView.builder(
                            itemCount: comments.length,
                            itemBuilder: (context, i) {
                              final comment = comments[i];
                              return CommentWidget(
                                comment: comment,
                              );
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 114.h,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: 104.h, top: 30.h, right: 20.w, left: 20.w),
                child: SizedBox(
                  height: 500.h,
                  child: EmojiKeyboard(
                      emojiKeyboardShowing: false,
                      commentTextController: commentTextController),
                ),
              ),
              Container(
                height: 114.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const Divider(
                      color: Color(0xffC4C4C4),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 21.w),
                      child: CommentBox(
                        focusNode: FocusNode(),
                        onEmojiTapped: (){},
                        commentTextController: commentTextController,
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }