import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pomo/core/constants/colors.dart';
import 'package:pomo/core/constants/images.dart';

/// @ahmdaeyz work
class SideSheet {
  /// Open Left side sheet
  /// ```dart
  ///onPressed: () => SideSheet.end(body: Text("Body"), context: context)
  /// ```
  static Future<dynamic> end(
      {required String title,
      Color backgroundColor = AppColors.red50,
      Color textColor = AppColors.red900,

      ///Use this to pass any widget you want to display in the side sheet
      required Widget body,
      required BuildContext context,

      /// Use this to set the width of the side sheet
      double? width,
      String barrierLabel = "Side Sheet",

      /// Use barrierDismissible to dismiss the side sheet by tapping outside of it
      bool barrierDismissible = true,

      /// Use barrierColor to set the outside color of the side sheet when opened

      /// Use transitionDuration to set the duration of the animation when the side sheet is opened or closed
      Duration transitionDuration = const Duration(milliseconds: 300)}) async {
    dynamic data = await _showSheetSide(
        title: title,
        body: body,
        width: width,
        startSide: true ,
        context: context,
        barrierLabel: barrierLabel,
        backgroundColor: backgroundColor,
        textColor: textColor,
        barrierDismissible: barrierDismissible,
        transitionDuration: transitionDuration);
    if (data == null) return '';

    return data;
  }

  static _showSheetSide({
    required String title,
    required Widget body,
    required bool startSide,
    double? width,
    required BuildContext context,
    required String barrierLabel,
    required bool barrierDismissible,
    required Duration transitionDuration,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return showGeneralDialog(
      barrierLabel: barrierLabel,
      barrierDismissible: barrierDismissible,
      transitionDuration: transitionDuration,
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Align(
            alignment: (startSide
                ? AlignmentDirectional.centerStart
                : AlignmentDirectional.centerEnd),
            child: Material(
                elevation: 15,
                color: Colors.transparent,
                child: Container(
                  height: double.infinity,
                  padding: const EdgeInsets.only(
                      top: 35, bottom: 32, right: 24, left: 24),
                  width: width ?? MediaQuery.of(context).size.width * 0.38,
                  decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: !startSide
                              ? const Radius.circular(12)
                              : Radius.zero,
                          bottomStart: !startSide
                              ? const Radius.circular(12)
                              : Radius.zero,
                          topEnd: startSide
                              ? const Radius.circular(12)
                              : Radius.zero,
                          bottomEnd: startSide
                              ? const Radius.circular(12)
                              : Radius.zero)),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(color: textColor),
                          ),
                          const Spacer(),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: SvgPicture.asset(Images.close,
                                      color: textColor, height: 24, width: 24),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 24),
                      Divider(color: textColor),
                      const SizedBox(height: 24),
                      Expanded(child: body)
                    ],
                  ),
                )));
      },
      transitionBuilder: (context, animation1, animation2, child) {
        return SlideTransition(
          position: Tween(
                  begin: Offset((startSide ? -1 : 1), 0),
                  end: const Offset(0, 0))
              .animate(animation1),
          child: child,
        );
      },
    );
  }
}
