import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ion_mobile/design/colors.dart';
import 'package:ion_mobile/design/dialogs/component_dialog/ion_component_dialog.dart';
import 'package:ion_mobile/design/iconography/ion_icons.dart';
import 'package:ion_mobile/design/typography/heading.dart';
import 'package:ion_mobile/design/typography/text_style.dart';

class IonTitle implements IonComponentDialog {
  final String title;
  final bool close;
  final Function()? onTapClose;
  final bool divider;

  IonTitle(
      {this.onTapClose,
      this.divider = false,
      this.close = false,
      required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: close
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              Text(title,
                  style: const IonTextStyleH2(
                      ionFontWeight: IonFontWeight.medium)),
              if (close)
                IconButton(
                  onPressed: onTapClose ?? () => Navigator.of(context).pop(),
                  icon: SvgPicture.asset(
                    IonIcons.close,
                    height: 24.h,
                    color: IonMainColors.primary100,
                    package: 'ion_mobile',
                  ),
                ),
            ],
          ),
          if (divider) const Divider()
        ],
      ),
    );
  }
}