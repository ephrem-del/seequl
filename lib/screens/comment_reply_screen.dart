import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seequl/config/path.dart';
import 'package:seequl/widgets/app_bar.dart';
import 'package:seequl/widgets/comment_box.dart';
import 'package:seequl/widgets/comment_widget.dart';
import 'package:seequl/widgets/emoji_keyboard.dart';

import '../models/comment.dart';

class CommentReplyScreen extends StatefulWidget {
  final XComment comment;
  const CommentReplyScreen({super.key, required this.comment});

  @override
  State<CommentReplyScreen> createState() => _CommentReplyScreenState();
}

class _CommentReplyScreenState extends State<CommentReplyScreen> {
  final commentTextController = TextEditingController();
  bool emojiKeyboardShowing = false;
  final focusNode = FocusNode();

  hideShowEmojiKeyboard() {
    emojiKeyboardShowing = emojiKeyboardShowing ? false : true;
    focusNode.unfocus();
    setState(() {});
  }

  @override
  void initState() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        emojiKeyboardShowing = false;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarWidget(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: Column(
                  children: [
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
                              color: const Color(0xff4B4B4B)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 41.h,
                    ),
                    SizedBox(
                      child: Stack(
                        children: [
                          Positioned(
                            left: 22.w,
                            child: Container(
                              width: 1.w,
                              height: 150.w,
                              color: const Color(0xff886826),
                            ),
                          ),
                          Column(
                            children: [
                              CommentWidget(
                                comment: widget.comment,
                                isReplying: true,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 53.w),
                                child: const Row(
                                  children: [
                                    Text(
                                      'Replying to',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'John Doe',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffFFBB00),
                                      ),
                                    ),
                                    Text(
                                      '@JohntheD',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffFFBB00),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 22.h,
                              ),
                              CommentBox(
                                focusNode: focusNode,
                                onEmojiTapped: hideShowEmojiKeyboard,
                                commentTextController: commentTextController,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 27.h,
                    ),
                    Expanded(
                      child: EmojiKeyboard(
                          emojiKeyboardShowing: emojiKeyboardShowing,
                          commentTextController: commentTextController),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
