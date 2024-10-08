import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ion_mobile/design/dialogs/component_dialog/ion_component_dialog.dart';
import 'package:ion_mobile/design/typography/heading.dart';
import 'package:ion_mobile/design/typography/text_style.dart';

class IonIconMessage implements IonComponentDialog {
  final String? message;
  final IconTypeIcon? typeIcon;

  IonIconMessage({this.typeIcon, required this.message});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (typeIcon != null)
          SvgPicture.asset(
            typeIcon?.type ?? '',
            package: 'ion_mobile',
            height: 56.h,
            width: 56.w,
          ),
        const SizedBox(height: 4),
        if (message != null)
          Text(
            message!,
            style: const IonTextStyleH2(
                ionFontWeight: IonFontWeight.medium,
                ionFontSize: IonH2FontSizeHeight.medium),
          ),
        SizedBox(
          height: 24.h,
        )
      ],
    );
  }
}