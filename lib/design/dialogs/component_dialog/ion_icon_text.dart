import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ion_mobile/design/dialogs/component_dialog/ion_component_dialog.dart';

class IonIconText implements IonComponentDialog {
  final String? icon;
  final Widget text;

  IonIconText({this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8).h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (icon != null)
                CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: SvgPicture.asset(
                    icon!,
                    package: 'ion_mobile',
                    height: 18.h,
                    width: 18.w,
                  ),
                ),
              SizedBox(
                width: 16.w,
              ),
              text
            ],
          )
        ],
      ),
    );
  }
}