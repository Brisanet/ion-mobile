import 'package:flutter/material.dart';
import 'package:ion_mobile/design/dialogs/component_dialog/ion_component_dialog.dart';

class IonCustomDialog extends StatelessWidget {
  final double? width;
  final double? height;
  final List<IonComponentDialog> componentDialogList;

  const IonCustomDialog(
      {super.key, this.width, this.height, required this.componentDialogList});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Dialog(
            elevation: 0,
            insetPadding: const EdgeInsets.all(25),
            backgroundColor: Colors.transparent,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff1c3692).withOpacity(0.30),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                    child: Container(
                  padding: const EdgeInsets.all(24),
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    ...componentDialogList.map((item) => item.build(context)),
                  ]),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}













