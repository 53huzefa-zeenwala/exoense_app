// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'core/app/main_app.dart';
import 'core/di/get_it_setup.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  final Iterable<dynamic> initialSetup = await Future.wait([
    getIt.allReady(),
  ]);

  setup();

  runApp(
    const MainApp(),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

// Future<ThemeData> getInitialThemeFromJson() async {
//   final themeStr = await rootBundle.loadString(AppAssets.theme);
//   final themeJson = jsonDecode(themeStr);
//
//   return ThemeDecoder.decodeThemeData(themeJson, validate: true) ?? ThemeData();
// }
