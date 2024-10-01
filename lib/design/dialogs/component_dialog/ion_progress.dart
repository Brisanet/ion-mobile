import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ion_mobile/design/colors.dart';
import 'package:ion_mobile/design/dialogs/component_dialog/ion_component_dialog.dart';
import 'package:ion_mobile/design/typography/body.dart';
import 'package:ion_mobile/design/typography/text_style.dart';

class IonProgress implements IonComponentDialog {
  final String? text;
  final bool? loading;
  final double? padding;

  IonProgress({this.padding, this.text, this.loading = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding ?? 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 30.h,
              width: 30.h,
              child: const CircularProgressIndicator(
                color: IonMainColors.primary100,
              )),
          SizedBox(
            width: 14.w,
          ),
          if (text != null)
            Expanded(
              child: Text(text!,
                  style: const IonTextStyleBody(
                      ionFontWeight: IonFontWeight.regular,
                      ionFontStyle: IonFontStyle.normal)),
            ),
        ],
      ),
    );
  }
}