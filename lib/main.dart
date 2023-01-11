import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wothoq_task/misc/bindings.dart';
import 'package:wothoq_task/misc/methods.dart';
import 'package:wothoq_task/misc/paths.dart';
import 'package:wothoq_task/views/base/base.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  injectDep();
  debugRepaintRainbowEnabled = true;
  //intiate and adjust loading overlay
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 30.0
    ..radius = 10.0
    ..progressColor = Colors.orange
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.orange
    ..textColor = Colors.orange
    ..maskColor = Colors.grey.withOpacity(0.3)
    ..maskType = EasyLoadingMaskType.custom
    ..userInteractions = false;
  await preCacheSVG(PathsManager.cartButton);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [],
  );

  runApp(
    const ProviderScope(
      child: BaseView(),
    ),
  );
}
