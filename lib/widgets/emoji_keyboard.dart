import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmojiKeyboard extends StatelessWidget {
  final bool emojiKeyboardShowing;
  final TextEditingController commentTextController;
  const EmojiKeyboard({super.key, required this.emojiKeyboardShowing, required this.commentTextController});

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !emojiKeyboardShowing,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.all(23.r),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xff6B6565),
          ),
          borderRadius: BorderRadius.circular(5.r),
          color: Colors.white,
        ),
        child: EmojiPicker(
          onBackspacePressed: () {
            // Do something when the user taps the backspace button (optional)
            // Set it to null to hide the Backspace-Button
          },
          textEditingController:
              commentTextController, // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
          config: Config(
            columns: 7,
            emojiSizeMax: 32 *
                (foundation.defaultTargetPlatform == TargetPlatform.iOS
                    ? 1.30
                    : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
            verticalSpacing: 0,
            horizontalSpacing: 0,
            gridPadding: EdgeInsets.zero,
            initCategory: Category.RECENT,
            bgColor: const Color.fromARGB(255, 255, 255, 255),
            indicatorColor: Colors.blue,
            iconColor: Colors.grey,
            iconColorSelected: Colors.blue,
            backspaceColor: Colors.blue,
            skinToneDialogBgColor: Colors.white,
            skinToneIndicatorColor: Colors.grey,
            enableSkinTones: true,
            recentTabBehavior: RecentTabBehavior.RECENT,
            recentsLimit: 28,
            noRecents: const Text(
              'No Recents',
              style: TextStyle(fontSize: 20, color: Colors.black26),
              textAlign: TextAlign.center,
            ), // Needs to be const Widget
            loadingIndicator:
                const SizedBox.shrink(), // Needs to be const Widget
            tabIndicatorAnimDuration: kTabScrollDuration,
            categoryIcons: const CategoryIcons(),
            buttonMode: ButtonMode.MATERIAL,
          ),
        ),
      ),
    );
  }
}
