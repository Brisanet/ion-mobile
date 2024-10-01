import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ion_mobile/design/dialogs/component_dialog/ion_component_dialog.dart';
import 'package:ion_mobile/widgets/button/button.dart';

class IonDoubleButtom implements IonComponentDialog {
  final String? txtFirstButton;
  final String? txtSecondButton;
  final Function() onTapFirstButton;
  final Function()? onTapSecondButton;
  final bool? isLoadingFirstButton;
  final bool? isLoadingSecondButton;
  final bool divider;

  IonDoubleButtom({
    this.isLoadingFirstButton = false,
    this.isLoadingSecondButton = false,
    this.txtFirstButton,
    this.txtSecondButton,
    required this.onTapFirstButton,
    this.onTapSecondButton,
    this.divider = false,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (divider) const Divider(),
          SizedBox(
            height: 14.h,
          ),
          if (txtFirstButton != null)
            Column(
              children: [
                IonButtonPrimary(
                  onTap: onTapFirstButton,
                  height: 40.h,
                  width: double.infinity,
                  isLoading: isLoadingFirstButton!,
                  text: txtFirstButton!,
                ),
                SizedBox(
                  height: 12.h,
                ),
              ],
            ),
          if (txtSecondButton != null)
            IonButtonGhost(
              onTap: onTapSecondButton ??
                  () {
                    Navigator.of(context).pop();
                  },
              height: 40.h,
              width: double.infinity,
              isLoading: isLoadingSecondButton!,
              text: txtSecondButton!,
            )
        ],
      ),
    );
  }
}