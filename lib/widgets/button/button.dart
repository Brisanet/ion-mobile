import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ion_mobile/design/colors.dart';
import 'package:ion_mobile/design/typography.dart';
import 'package:ion_mobile/widgets/button/button_colors.dart';
import 'package:ion_mobile/widgets/circular_loading.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

//! fazer text e icones aumentarem de acordo com a area disponibilizada

abstract class IonButton extends StatelessWidget {
  String text;
  String loadingText;
  final void Function() onTap;
  void Function() onTapCancel = () {};
  void Function(bool) onHover = (bool isHover) {};
  void Function(TapUpDetails) onTapUp = (TapUpDetails details) {};
  void Function(TapDownDetails) onTapDown = (TapDownDetails details) {};
  final Widget? icon;
  String? ionIcon;
  Color? ionIconColor;
  final bool disabled;
  final bool isDanger;
  final List<Color> gradientColors;
  bool isLoading = false;
  bool dashedBorder;
  IonTextColor ionTextColor;
  Color color;
  Color borderColor;
  final double width;
  final double height;

  IonButton({
    Key? key,
    this.text = '',
    this.loadingText = 'Loading',
    required this.onTap,
    required this.color,
    required this.width,
    required this.height,
    this.borderColor = IonExtraColors.transparent,
    this.dashedBorder = false,
    this.icon,
    this.ionIcon,
    this.ionIconColor,
    this.disabled = false,
    this.isDanger = false,
    this.gradientColors = const [
      IonMainColors.neutral1,
      IonMainColors.neutral2,
      IonMainColors.neutral3,
      IonMainColors.neutral4,
    ],
    required this.isLoading,
    required this.ionTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (_, setState) => InkWell(
        mouseCursor:
            disabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
        onTap: disabled ? null : onTap,
        onHover: (hover) {
          if (!disabled) {
            setState(() {
              onHover(hover);
            });
          }
        },
        onTapUp: (details) {
          if (!disabled) {
            setState(() {
              onTapUp(details);
            });
          }
        },
        onTapDown: (details) {
          if (!disabled) {
            setState(() {
              onTapDown(details);
            });
          }
        },
        onTapCancel: () {
          setState(() {
            onTapCancel();
          });
        },
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
            border: dashedBorder
                ? RDottedLineBorder.all(
                    color: borderColor,
                    width: 1,
                  )
                : Border.all(
                    color: borderColor,
                    width: 1,
                  ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0).r,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  !isLoading && ionIcon != null
                      ? SvgPicture.asset(
                          ionIcon!,
                          package: 'ion_mobile',
                          allowDrawingOutsideViewBox: true,
                          color: disabled ? IonMainColors.neutral5 : ionIconColor,
                        )
                      : !isLoading && icon != null
                          ? icon!
                          : const SizedBox(),
                  Visibility(
                    visible: isLoading,
                    child: ZoomIn(
                      child:  Row(
                        children: [
                          SizedBox(
                            height: 18.h,
                            width: 18.h,
                            child: CircularProgressIndicator(color: disabled ? IonMainColors.neutral5 : ionIconColor,  strokeWidth: 3.h,)),
                        ],
                      ),
                    ),
                  ),
                  AnimatedContainer(
                      transform: Matrix4.translationValues(
                        isLoading ? 4.w : 0,
                        0,
                        0,
                      ),
                      duration: const Duration(milliseconds: 500),
                      child: text != ''
                          ? SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    isLoading ? loadingText : text,
                                    style: IonTextStyleBody(
                                      ionFontWeight: IonFontWeight.medium,
                                      ionFontStyle: IonFontStyle.normal,
                                      ionTextColor: disabled
                                          ? IonTextColor.neutral5
                                          : ionTextColor,
                                      ionFontSize: IonBodyFontSizeHeight.large,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IonButtonPrimary extends IonButton {
  IonButtonPrimary(
      {Key? key,
      String text = '',
      super.loadingText,
      bool isDanger = false,
      required void Function() onTap,
      super.disabled,
      super.icon,
      super.ionIcon,
      required super.height,
      required super.width,
      required super.isLoading})
      : super(
          key: key,
          text: text,

          isDanger: isDanger,
          onTap: onTap,
          ionIconColor: IonButtonPrimaryColors(isDanger).iconColor,
          color: disabled
              ? IonMainColors.neutral3
              : IonButtonPrimaryColors(isDanger).color,
          ionTextColor: IonButtonPrimaryColors(isDanger).textColor,
        );

  // corrigir o onTapUp que deveria mudar a cor porem nao esta alterando pois e usado o setState e ele reconstroi o componente e consequentemente chama o construtor

  @override
  void Function(bool hover) get onHover => (hover) {
        if (!disabled) {
          if (hover) {
            color = IonButtonPrimaryColors(isDanger).onHover;
          } else {
            color = IonButtonPrimaryColors(isDanger).color;
          }
        }
      };

  @override
  void Function(TapUpDetails details) get onTapUp => (details) {
        color = IonButtonPrimaryColors(isDanger).color;
        onHover(true);
      };

  @override
  void Function(TapDownDetails details) get onTapDown => (details) {
        color = IonButtonPrimaryColors(isDanger).onTapDown;
      };
}

class IonButtonSecundary extends IonButton {
  IonButtonSecundary(
      {Key? key,
      String text = '',
      super.loadingText,
      bool isDanger = false,
      required void Function() onTap,
      super.icon,
      super.ionIcon,
      super.disabled,
      required super.height,
      required super.width,
      required super.isLoading})
      : super(
          key: key,
          text: text,
          onTap: onTap,
          isDanger: isDanger,
          ionIconColor: IonButtonSecundaryColors(isDanger).iconColor,
          color: IonButtonSecundaryColors(isDanger).color,
          borderColor: IonButtonSecundaryColors(isDanger).borderColor,
          ionTextColor: IonButtonSecundaryColors(isDanger).textColor,
          gradientColors: IonButtonSecundaryColors(isDanger).gradientColors,
        );

  @override
  void Function(bool hover) get onHover => (hover) {
        if (hover) {
          color = IonButtonSecundaryColors(isDanger).onHoverColor;
          borderColor = IonButtonSecundaryColors(isDanger).onHoverBorderColor;
        } else {
          color = IonButtonSecundaryColors(isDanger).color;
          borderColor = IonButtonSecundaryColors(isDanger).borderColor;
        }
      };

  @override
  void Function(TapUpDetails details) get onTapUp => (details) {
        color = IonButtonSecundaryColors(isDanger).color;
        borderColor = IonButtonSecundaryColors(isDanger).borderColor;
        ionTextColor = IonButtonSecundaryColors(isDanger).textColor;
        ionIconColor = IonButtonSecundaryColors(isDanger).iconColor;
        onHover(true);
      };

  @override
  void Function(TapDownDetails details) get onTapDown => (details) {
        color = IonButtonSecundaryColors(isDanger).onTapDownColor;
        borderColor = IonButtonSecundaryColors(isDanger).onTapDownBorderColor;
        ionTextColor = IonButtonSecundaryColors(isDanger).onTapDownTextColor;
        ionIconColor = IonButtonSecundaryColors(isDanger).onTapDownIconColor;
      };
}

class IonButtonGhost extends IonButton {
  IonButtonGhost(
      {Key? key,
      String text = '',
      super.loadingText,
      bool isDanger = false,
      required void Function() onTap,
      super.icon,
      super.ionIcon,
      super.disabled,
      required super.height,
      required super.width,
      required super.isLoading})
      : super(
          key: key,
          text: text,
          onTap: onTap,
          isDanger: isDanger,
          ionIconColor: IonButtonGhostColors(isDanger).iconColor,
          color: IonButtonGhostColors(isDanger).color,
          ionTextColor: IonButtonGhostColors(isDanger).textColor,
          gradientColors: IonButtonGhostColors(isDanger).gradientColors,
        );

  @override
  void Function(bool hover) get onHover => (hover) {
        if (hover) {
          color = IonButtonGhostColors(isDanger).onHover;
        } else {
          color = IonButtonGhostColors(isDanger).color;
        }
      };

  @override
  void Function(TapUpDetails details) get onTapUp => (details) {
        color = IonButtonGhostColors(isDanger).color;
        ionTextColor = IonButtonGhostColors(isDanger).textColor;
        ionIconColor = IonButtonGhostColors(isDanger).iconColor;
        onHover(true);
      };

  @override
  void Function(TapDownDetails details) get onTapDown => (details) {
        color = IonButtonGhostColors(isDanger).onTapDownColor;
        ionTextColor = IonButtonGhostColors(isDanger).onTapDownTextColor;
        ionIconColor = IonButtonGhostColors(isDanger).onTapDownIconColor;
      };
}

class IonButtonDashed extends IonButton {
  IonButtonDashed(
      {Key? key,
      String text = '',
      super.loadingText,
      bool isDanger = false,
      required void Function() onTap,
      super.icon,
      super.ionIcon,
      super.dashedBorder = true,
      super.disabled,
      required super.height,
      required super.width,
      required super.isLoading})
      : super(
          key: key,
          text: text,
          onTap: onTap,
          isDanger: isDanger,
          color: IonButtonDashedColors(isDanger).color,
          ionIconColor: IonButtonDashedColors(isDanger).iconColor,
          borderColor: IonButtonDashedColors(isDanger).borderColor,
          ionTextColor: IonButtonDashedColors(isDanger).textColor,
          gradientColors: IonButtonDashedColors(isDanger).gradientColors,
        );

  @override
  void Function(bool hover) get onHover => (hover) {
        if (hover) {
          color = IonButtonDashedColors(isDanger).onHoverColor;
          borderColor = IonButtonDashedColors(isDanger).onHoverBorderColor;
        } else {
          color = IonButtonDashedColors(isDanger).color;
          borderColor = IonButtonDashedColors(isDanger).borderColor;
        }
      };

  @override
  void Function(TapUpDetails details) get onTapUp => (details) {
        color = IonButtonDashedColors(isDanger).color;
        borderColor = IonButtonDashedColors(isDanger).borderColor;
        ionTextColor = IonButtonDashedColors(isDanger).textColor;
        ionIconColor = IonButtonDashedColors(isDanger).iconColor;
        onHover(true);
      };

  @override
  void Function(TapDownDetails details) get onTapDown => (details) {
        color = IonButtonDashedColors(isDanger).onTapDownColor;
        borderColor = IonButtonDashedColors(isDanger).onTapDownBorderColor;
        ionTextColor = IonButtonDashedColors(isDanger).onTapDownTextColor;
        ionIconColor = IonButtonDashedColors(isDanger).onTapDownIconColor;
      };
}
