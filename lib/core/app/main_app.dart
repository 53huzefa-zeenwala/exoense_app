import 'dart:ui';

import '../route/app_routing.dart';
import 'styles.dart';
// import 'package:cms_main_one/core/di/get_it_setup.dart';
// import 'package:cms_main_one/core/routes/app_router.dart';
// import 'package:cms_main_one/features/authentication/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with RouterMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'Flutter Demo',
      theme: getTheme(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            background: Colors.white,
            seedColor: const Color(0xFF00B495),
          ),
        ),
      ),
      routerConfig: router,
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
      };
}

// class _MainAppState extends State<MainApp> with RouterMixin {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => getIt<AuthenticationBloc>()..add(AppStarted()),
//       child: MaterialApp.router(
//         title: 'Flutter Project',
//         theme: getTheme(theme: widget.initialTheme),
//         themeAnimationDuration: const Duration(
//           seconds: 1,
//         ),
//         // debugShowCheckedModeBanner: false,
//         routerConfig: router,
//       ),
//     );
//   }
// }
