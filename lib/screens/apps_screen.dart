import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/path.dart';
import '../repo/comments.dart';
import '../widgets/comment_bottom_sheet.dart';
import '../widgets/menu_bar.dart';

class AppsScreen extends StatefulWidget {
  final bool showItems;
  final void Function() hideShow;
  const AppsScreen({
    super.key,
    required this.showItems,
    required this.hideShow,
  });

  @override
  State<AppsScreen> createState() => _AppsScreenState();
}

class _AppsScreenState extends State<AppsScreen> {
  bool isShowingAllText = false;
  bool isTextLong = false;
  bool emojiKeyboardShowing = false;
  final commentTextController = TextEditingController();
  final focusNode = FocusNode();

  String content =
      'Lorem ipsum dolor sit amet consectetur. Amet aenean et nunc enim ornare vulputate. Id blandit massa id dictum pellentesque. Nulla vitae aliquam massa lectus tincidunt tortor. Quisque';
  String time = '27 Oct. 2020 @5:23pm';

  checkText() {
    if (content.split('').length > 150) {
      isTextLong = true;
    }
  }

  hideShowAllText() {
    isShowingAllText = isShowingAllText ? false : true;
    setState(() {});
  }

  hideShowEmojiKeyboard() {
    emojiKeyboardShowing = emojiKeyboardShowing ? false : true;
    setState(() {});
  }

  @override
  void initState() {
    checkText();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              AppAssets.image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 18.h,
            left: 25.w,
            child: InkWell(
              onTap: () {
                showMenuBar(context: context);
              },
              child: Image.asset(
                AppIcons.drawer,
                width: 27.w,
              ),
            ),
          ),
          widget.showItems
              ? Positioned(
                  bottom: 9.h,
                  right: 0,
                  child: InkWell(
                    onTap: widget.hideShow,
                    child: Image.asset(
                      AppIcons.hideShow,
                      width: 37.w,
                    ),
                  ),
                )
              : Positioned(
                  bottom: 33.h,
                  left: 0,
                  child: InkWell(
                    onTap: widget.hideShow,
                    child: RotatedBox(
                      quarterTurns: 2,
                      child: Image.asset(
                        AppIcons.hideShow,
                        width: 37.w,
                      ),
                    ),
                  ),
                ),
          actions(),
          textBody(),
        ],
      ),
    );
  }

  Widget actions() {
    if (widget.showItems) {
      return Positioned(
        bottom: 64.h,
        right: 8.5.w,
        child: SizedBox(
          width: 27.5.w,
          child: Column(
            children: [
              Image.asset(
                AppAssets.user5,
              ),
              SizedBox(
                height: 15.h,
              ),
              Image.asset(AppIcons.content),
              SizedBox(
                height: 15.h,
              ),
              InkWell(
                onTap: () {
                  commentBottomSheet(
                    commentTextController: commentTextController,
                    context: context,
                    comments: comments,
                  );
                },
                child: Image.asset(
                  AppIcons.message,
                ),
              ),
              Text(
                '45k',
                style: TextStyle(color: Colors.white, fontSize: 13.6.sp),
              ),
              SizedBox(
                height: 12.h,
              ),
              Image.asset(AppIcons.heartWhite),
              Text(
                '45k',
                style: TextStyle(color: Colors.white, fontSize: 13.6.sp),
              ),
              SizedBox(
                height: 15.h,
              ),
              Image.asset(AppIcons.share),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget textBody() {
    if (widget.showItems) {
      return Positioned(
        bottom: 9.h,
        left: 18.w,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffC4C4C4),
              ),
              borderRadius: BorderRadius.circular(15.r),
              color: const Color.fromRGBO(76, 66, 67, 0.66)),
          width: 345.w,
          padding: EdgeInsets.only(
            top: 12.h,
            left: 21.w,
            right: 4.w,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isShowingAllText
                      ? InkWell(
                          onTap: hideShowAllText,
                          child: Padding(
                            padding: EdgeInsets.only(right: 12.w, bottom: 9.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(4.r),
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(44, 43, 43, 0.80),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Row(children: [
                                    Text(
                                      '...Less',
                                      style: TextStyle(
                                        color: const Color(0xff2CCAA0),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    RotatedBox(
                                      quarterTurns: 2,
                                      child: Image.asset(
                                        AppIcons.direction,
                                        height: 17.h,
                                        width: 17.w,
                                      ),
                                    )
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  Text(
                    isShowingAllText || !isTextLong
                        ? content
                        : content.replaceRange(150, null, '...'),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    time,
                    style: TextStyle(
                        color: const Color(0xffE5A5A5),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
              isTextLong && !isShowingAllText
                  ? Positioned(
                      right: 7.w,
                      bottom: 10.h,
                      child: InkWell(
                        onTap: hideShowAllText,
                        child: Container(
                          padding: EdgeInsets.all(4.r),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(44, 43, 43, 0.80),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(children: [
                            Text(
                              '...More',
                              style: TextStyle(
                                color: const Color(0xff2CCAA0),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Image.asset(
                              AppIcons.direction,
                              height: 17.h,
                              width: 17.w,
                            )
                          ]),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
