import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_ephrem/config/path.dart';
import 'package:test_ephrem/repo/comments.dart';
import 'package:test_ephrem/widgets/comment_widget.dart';

import '../widgets/app_bar.dart';
import '../widgets/comment_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showItems = true;
  bool isShowingAllText = false;
  bool isTextLong = false;

  String content =
      'Lorem ipsum dolor sit amet consectetur. Amet aenean et nunc enim ornare vulputate. Id blandit massa id dictum pellentesque. Nulla vitae aliquam massa lectus tincidunt tortor. Quisque';
  String time = '27 Oct. 2020 @5:23pm';
  hideShowBottomNavigationBar() {
    showItems = showItems ? false : true;
    setState(() {});
  }

  checkText() {
    if (content.split('').length > 150) {
      isTextLong = true;
    }
  }

  hideShowAllText() {
    isShowingAllText = isShowingAllText ? false : true;
    setState(() {});
  }

  showMenuBar() {
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
                Text('Post a seequl'),
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
                Text('View your likes'),
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
                Text('Your seequl posts'),
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
                Text('Reference contribution'),
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
                Text('Hashtag challenges'),
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
                Text('Notifications'),
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
                Text('About SeeQul'),
              ],
            ),
          ),
        ]);
  }

  commentBottomSheet() {
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
                      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 14.w),
                      decoration: BoxDecoration(
                        color: Color(0xff5F6368),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5.r),
                          bottomRight: Radius.circular(5.r),
                        ),
                      ),
                      child: Text(
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
                    SizedBox(height: 114.h,)
                  ],
                ),
              ),
              Container(
                height: 114.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Divider(color: Color(0xffC4C4C4),),
                    SizedBox(height: 20.h,),
                    Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.w),
                      child: CommentBox(),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }

  @override
  void initState() {
    checkText();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: showItems
          ? Container(
              height: 72.h,
              color: Color(0xff2E2E2E),
              child: BottomNavigationBar(
                useLegacyColorScheme: false,
                // backgroundColor: Colors.transparent,
                // selectedLabelStyle: TextStyle(color: Color(0xffFFDD5E)),
                // unselectedLabelStyle: TextStyle(color: Colors.white),
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      AppIcons.apps,
                      height: 24.r,
                    ),
                    label: 'Apps',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      AppIcons.qucon,
                      height: 24.r,
                    ),
                    label: 'Qucon',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      AppIcons.bot,
                      height: 24.r,
                    ),
                    label: 'Zaady',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      AppIcons.organise,
                      height: 24.r,
                    ),
                    label: 'Organize',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      AppIcons.profile,
                      height: 24.r,
                    ),
                    label: 'Profile',
                  ),
                ],
              ),
            )
          : SizedBox.shrink(),
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(),
            Expanded(
              child: Stack(
                children: [
                  SizedBox(
                    child: Image.asset(
                      AppAssets.image,
                      fit: BoxFit.cover,
                    ),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Positioned(
                    top: 18.h,
                    left: 25.w,
                    child: InkWell(
                      onTap: showMenuBar,
                      child: Image.asset(
                        AppIcons.drawer,
                        width: 27.w,
                      ),
                    ),
                  ),
                  showItems
                      ? Positioned(
                          bottom: 9.h,
                          right: 0,
                          child: InkWell(
                            onTap: hideShowBottomNavigationBar,
                            child: Image.asset(
                              AppIcons.hideShow,
                              width: 37.w,
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  !showItems
                      ? Positioned(
                          bottom: 33.h,
                          left: 0,
                          child: InkWell(
                            onTap: hideShowBottomNavigationBar,
                            child: RotatedBox(
                              quarterTurns: 2,
                              child: Image.asset(
                                AppIcons.hideShow,
                                width: 37.w,
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  showItems
                      ? Positioned(
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
                                  onTap: commentBottomSheet,
                                  child: Image.asset(
                                    AppIcons.message,
                                  ),
                                ),
                                Text(
                                  '45k',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13.6.sp),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Image.asset(AppIcons.heartWhite),
                                Text(
                                  '45k',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13.6.sp),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Image.asset(AppIcons.share),
                              ],
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  showItems
                      ? Positioned(
                          bottom: 9.h,
                          left: 18.w,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xffC4C4C4),
                                ),
                                borderRadius: BorderRadius.circular(15.r),
                                color: Color.fromRGBO(76, 66, 67, 0.66)),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    isShowingAllText
                                        ? InkWell(
                                            onTap: hideShowAllText,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  right: 12.w, bottom: 9.h),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(4.r),
                                                    decoration: BoxDecoration(
                                                      color: Color.fromRGBO(
                                                          44, 43, 43, 0.80),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.r),
                                                    ),
                                                    child: Row(children: [
                                                      Text(
                                                        '...Less',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff2CCAA0),
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                        : SizedBox.shrink(),
                                    Text(
                                      isShowingAllText || !isTextLong
                                          ? content
                                          : content.replaceRange(
                                              150, null, '...'),
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
                                          color: Color(0xffE5A5A5),
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
                                              color: Color.fromRGBO(
                                                  44, 43, 43, 0.80),
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                            child: Row(children: [
                                              Text(
                                                '...More',
                                                style: TextStyle(
                                                  color: Color(0xff2CCAA0),
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
                                    : SizedBox.shrink(),
                              ],
                            ),
                            width: 345.w,
                            padding: EdgeInsets.only(
                              top: 12.h,
                              left: 21.w,
                              right: 4.w,
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
