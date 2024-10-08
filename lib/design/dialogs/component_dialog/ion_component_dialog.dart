import 'package:flutter/material.dart';
import 'package:ion_mobile/design/iconography/ion_icons.dart';

abstract class IonComponentDialog {
  Widget build(BuildContext context);
}

enum IconTypeIcon {
  info(IonIcons.indicativeInfo),
  warning(IonIcons.indicativeWarning),
  positive(IonIcons.indicativePositive),
  negative(IonIcons.indicativeNegative);

  final String type;
  const IconTypeIcon(this.type);
}
