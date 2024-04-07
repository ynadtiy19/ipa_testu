import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';

import 'package:my_first_app/app/app.bottomsheets.dart'; // Assuming these are the components you want to merge from your first app
import 'package:my_first_app/app/app.dialogs.dart'; // Assuming these are the components you want to merge from your first app
import 'package:my_first_app/app/app.locator.dart'; // Assuming these are the components you want to merge from your first app
import 'package:my_first_app/app/app.router.dart'; // Assuming these are the components you want to merge from your first app
import 'package:my_first_app/services/components/HideKeyboard.dart';
import 'package:my_first_app/stores/AIChatStore.dart';
import 'package:my_first_app/ui/utils/Chatgpt.dart';
// import 'package:my_first_app/ui/views/chat/page/AppOpenPage.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  await ChatGPT.initChatGPT();
  await setupLocator(); // Assuming this is a function from your first app
  setupDialogUi(); // Assuming this is a function from your first app
  setupBottomSheetUi(); // Assuming this is a function from your first app
  runApp(
    ChangeNotifierProvider(
      create: (context) => AIChatStore(),
      child: const MyApp(),
    ),
  );
  configLoading();
}

void enterFullScreenButKeepBottomOverlay() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HideKeyboard(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFFF6F1F1),
          brightness: Brightness.light,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
          fontFamily: 'Poppins',
        ),
        // home: const SplashPage(),
        initialRoute: Routes.startupView,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        navigatorObservers: [
          StackedService.routeObserver,
        ],
        builder: EasyLoading.init(),
      ),
    );
  }
}

Future<void> configLoading() async {
  EasyLoading.instance
    ..maskType = EasyLoadingMaskType.none
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..displayDuration = const Duration(milliseconds: 1000)
    ..userInteractions = false;
}
