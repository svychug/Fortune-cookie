import 'package:cookie/ui/screens/intro_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'localization/locale_string.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  _requestPermission();
  runApp(const MyApp());
}

_requestPermission() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.storage,
  ].request();
  final info = statuses[Permission.storage].toString();
  if (kDebugMode) {
    print(info);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocaleString(),
      locale: const Locale('en','US'),
      debugShowCheckedModeBanner: false,
      title: 'Fortune Cookie',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryColor: Colors.pink,
      ),
      home: const IntroScreen(),
          //LoadingScreen(),
    );
  }
}
