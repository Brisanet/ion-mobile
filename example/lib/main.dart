import 'package:example/widgets/button.component.dart';
import 'package:example/widgets/step.component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterbook/flutterbook.dart';
import 'package:ion_mobile/design/colors.dart';
import 'package:ion_mobile/design/dialogs/component_dialog/ion_component_dialog.dart';
import 'package:ion_mobile/design/dialogs/component_dialog/ion_double_button.dart';
import 'package:ion_mobile/design/dialogs/component_dialog/ion_icon_message.dart';
import 'package:ion_mobile/design/dialogs/component_dialog/ion_icon_text.dart';
import 'package:ion_mobile/design/dialogs/component_dialog/ion_media.dart';
import 'package:ion_mobile/design/dialogs/component_dialog/ion_progress.dart';
import 'package:ion_mobile/design/dialogs/component_dialog/ion_title.dart';
import 'package:ion_mobile/design/dialogs/custom_dialog/custom_dialog.dart';
import 'package:ion_mobile/design/iconography/ion_icons.dart';
import 'package:ion_mobile/ion_mobile.dart';
import 'package:ion_mobile/widgets/input/input.dart';
import 'package:video_player/video_player.dart';
import 'widgets/date_picker.component.dart';

void main() {
  runApp(ScreenUtilInit(
    designSize: const Size(360, 800),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        // darkTheme: ThemeData(brightness: Brightness.dark),
        // themeMode: ThemeMode.dark,
      );
    },
    child: const Home(), //FlutterBookPage(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = false;
  bool initialized = false;
  VideoPlayerController videoController = VideoPlayerController.asset(
      "assets/videos/tutorial_route_1.mp4",
      videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true));

    Future<void> initVideos() async {
    if (initialized) return;
    initialized = true;
    await videoController.initialize();
    videoController.setLooping(true);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IonChipSelected(
              text: 'Loren Ipsum, 100 - Centro',
              icon: IonIcons.localization,
              onDeleted: () => debugPrint('teste'),
            ),
            const SizedBox(
              height: 10,
            ),
            IonChipUnselected(
              text: 'Loren Ipsum, 100 - Centro',
              icon: IonIcons.localization,
              onDeleted: () => debugPrint('teste'),
            ),
            const SizedBox(
              height: 10,
            ),
            IonButtonPrimary(
              ionIcon: IonIcons.pencil,
              text: "CustomDialog",
              loadingText: "Salvando",
              height: 48.h,
              width: 150.w,
              isLoading: isLoading,
              onTap: () => setState(() {
                isLoading = !isLoading;
                showDialog(
                    context: context,
                    builder: (_) => IonCustomDialog(
                           
                            componentDialogList: [
                              
                              IonTitle(title: 'Título aqui',  divider: true, close: true),
                              IonProgress(loading: true, text: 'Carregando', padding: 20),
                              IonIconMessage(
                                typeIcon: IconTypeIcon.positive,
                                message: 'Mensagem aqui!',
                              ),
                              IonMedia(
                                imageUrl: IonImages.securityPolicies,
                                // videoController: videoController,
                                // future: initVideos()
                                ),
                              IonIconText(
                                  icon: IonIcons.pencil,
                                  text: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: 'Texto regular, ',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        height: 1.4,
                                        color: IonMainColors.neutral7,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' bold ',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            height: 1.4,
                                            color: IonMainColors.neutral7,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'ou',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            height: 1.4,
                                            color: IonMainColors.neutral7,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' itálico!',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontStyle: FontStyle.italic,
                                            height: 1.4,
                                            color: IonMainColors.neutral7,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),

                              IonIconText(
                                  icon: IonIcons.localization,
                                  text: Expanded(
                                    child: Text(
                                      'Testando este componente',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: IonMainColors.neutral7,
                                      ),
                                    ),
                                  )),
                              IonIconText(
                                  text: Expanded(
                                    child: Text(
                                      'Testando este componente asasasasas asdfsdgvfdgbsfsd asdsadasdad asdsadsadsad asdss',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: IonMainColors.neutral7,
                                      ),
                                    ),
                                  )),
                              IonDoubleButtom(
                                  // divider: true,
                                  txtFirstButton: 'Ação Principal',
                                  txtSecondButton: 'Fechar',
                                  onTapFirstButton: () {})
                            ]));
              }),
            ),
            const SizedBox(
              height: 20,
            ),
            IonButtonPrimary(
              ionIcon: IonIcons.pencil,
              text: "Salvar",
              loadingText: "Salvando",
              height: 48.h,
              width: 150.w,
              isLoading: isLoading,
              onTap: () => setState(() {
                isLoading = !isLoading;
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            IonButtonSecundary(
              ionIcon: IonIcons.localization,
              text: "Salvar",
              height: 48.h,
              width: 296.w,
              isLoading: isLoading,
              onTap: () => setState(() {
                isLoading = !isLoading;
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            IonButtonGhost(
              onTap: () => setState(() {
                isLoading = !isLoading;
              }),
              text: "Salvar",
              height: 48.h,
              width: 296.w,
              isLoading: isLoading,
            ),
            const SizedBox(
              height: 10,
            ),
            IonButtonDashed(
              onTap: () => setState(() {
                isLoading = !isLoading;
              }),
              text: "Salvar",
              height: 48.h,
              width: 296.w,
              isLoading: isLoading,
            ),
            const SizedBox(
              height: 10,
            ),
            IonButtonSecundary(
              icon: SvgPicture.asset(
                'assets/icons/Photo.svg',
                color: IonMainColors.primary6,
                height: 30,
              ),
              height: 60.h,
              width: 60.w,
              isLoading: isLoading,
              onTap: () => setState(() {
                isLoading = !isLoading;
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            IonInput(
                maxLines: 3,
                height: 82.h,
                width: 292.w,
                hintText:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pharetra nunc ac tempus porttitor. Suspendisse eleifend nec justo sed tempor. Praesent nec ipsum at justo scelerisque suscipit eget vel nisl...'),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: IonTextInput(
                labelText: 'Teste',
                prefixIcon: Icon(Icons.lock, color: Colors.grey),
                hasObscureText: true,
                suffixIcon: Icon(Icons.visibility, color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class HotreloadWidgetbook extends StatelessWidget {
//   const HotreloadWidgetbook({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Widgetbook.material(
//         categories: [
//           WidgetbookCategory(
//             name: 'widgets',
//             widgets: [
//               WidgetbookComponent(
//                 name: 'Button',
//                 useCases: [
//                   WidgetbookUseCase(
//                     name: 'Primary',
//                     builder: (context) => Center(
//                       child: IonButtonPrimary(
//                         text: context.knobs
//                             .text(label: "Entrar", initialValue: "Salvar"),
//                         height: 48.h,
//                         width: 296.w,
//                         isLoading: false,
//                         onTap: () {},
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           )
//         ],
//         themes: [
//           WidgetbookTheme(
//             name: 'Light',
//             data: ThemeData.light(),
//           ),
//           WidgetbookTheme(
//             name: 'Dark',
//             data: ThemeData.dark(),
//           ),
//         ],
//         appInfo: AppInfo(name: 'Ion Mobile'),
//         devices: [
//           Apple.iPhone12,
//           Apple.iPhone13,
//           Samsung.s10,
//           Samsung.s21ultra,
//         ]);
//   }
// }

class FlutterBookPage extends StatelessWidget {
  const FlutterBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterBook(
        //no header pode colocar ion by brisatech com a logo ou alguma coisa do tipo
        headerPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        categories: [
          Category(
            categoryName: 'Ion',
            organizers: [
              Folder(
                folderName: 'Navigation',
                organizers: [
                  buttonComponent(),
                  stepComponent(),
                ],
              ),
              Folder(
                folderName: 'Data Entry',
                organizers: [
                  datePickerComponent(),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
