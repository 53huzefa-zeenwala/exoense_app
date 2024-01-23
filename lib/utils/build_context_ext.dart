// import 'package:cms_panel/features/widgets/snack_bar.dart';
import 'package:flutter/material.dart';

import 'screen_breakpoints.dart';

extension Context on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  TextTheme get primaryTextTheme => Theme.of(this).primaryTextTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  void closeKeyboard() => FocusScope.of(this).unfocus();

  // void showSnackBarMessage(
  //   String message, {
  //   bool isError = true,
  // }) {
  //   if (mounted) {
  //     ScaffoldMessenger.of(this).showSnackBar(
  //       SnackBar(
  //         content: AlertSnackBar(
  //           message: message,
  //           alertType: isError ? AlertType.error : AlertType.success,
  //         ),
  //         behavior: SnackBarBehavior.floating,
  //         backgroundColor: Colors.transparent,
  //         elevation: 0,
  //         width: 420,
  //
  //       ),
  //     );
  //   }
  // }

  bool get isDesktop {
    final maxWidth = MediaQuery.sizeOf(this).width;
    return maxWidth > tabletScreenBreakpoint;
  }

  bool get isMobileScreen =>
      MediaQuery.of(this).size.width <= mobileScreenBreakpoint;

  bool get isTabletScreen {
    final current = MediaQuery.of(this).size.width;
    return current >= mobileScreenBreakpoint &&
        current <= tabletScreenBreakpoint;
  }

  bool get isSmallDesktopScreen =>
      MediaQuery.of(this).size.width <= smallDesktopScreenBreakpoint &&
      MediaQuery.of(this).size.width > tabletScreenBreakpoint;

  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
}
