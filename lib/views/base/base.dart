import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:wothoq_task/misc/localizations.dart';
import 'package:wothoq_task/misc/routing.dart';
import 'package:wothoq_task/misc/theme.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        ...GlobalMaterialLocalizations.delegates,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
      locale: Locale(GetStorage().read("language") ?? "en"),
      supportedLocales: const [
        Locale("ar", "EG"),
        Locale("en", "US"),
      ],
      theme: ThemeManager().lightTheme,
      translations: LocalizationManager(),
      initialRoute: RoutingManager.productScreen,
      getPages: RoutingManager.routes,
      builder: EasyLoading.init(
        builder: (context, child) {
          return ResponsiveWrapper.builder(
            child,
            maxWidth: 1000,
            minWidth: 480,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.autoScale(
                600,
              ),
            ],
          );
        },
      ),
    );
  }
}
