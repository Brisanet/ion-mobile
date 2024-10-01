import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ion_mobile/design/dialogs/component_dialog/ion_component_dialog.dart';
import 'package:video_player/video_player.dart';

class IonMedia implements IonComponentDialog {
  final String? imageUrl;
  final Future<Object?>? future;
  final VideoPlayerController? videoController;
  final bool? roundedBorder;
  final double? height;
  final double? width;

  IonMedia(
      {this.future,
      this.videoController,
      this.height,
      this.width,
      this.imageUrl,
      this.roundedBorder});

  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.only(bottom: 8).h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (imageUrl != null)
            SvgPicture.asset(imageUrl!,
                fit: BoxFit.cover,
                height: height,
                width: width,
                package: 'ion_mobile'),
          if (videoController != null)
            SizedBox(
                height: 280,
                child: FutureBuilder(
                  future: future,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      videoController!.play();
                      return ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: VideoPlayer(videoController!));
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ))
        ],
      ),
    );
  }
}