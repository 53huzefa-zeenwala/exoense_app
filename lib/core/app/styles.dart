import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getTheme({required ThemeData theme}) => _getTheme(theme);

const _lightest = Colors.white;
const _darker = Colors.black87;
const _disabled = Colors.grey;

const linearGradient = LinearGradient(
  begin: Alignment(0.23, -0.97),
  end: Alignment(-0.23, 0.97),
  colors: [Color(0xFF63B4AE), Color(0xFF438883)],
);

ThemeData _getTheme(ThemeData initialTheme) {
  final colorScheme = initialTheme.colorScheme;
  final textTheme = _getTextTheme(colorScheme, initialTheme.brightness);
  final primaryTextTheme = textTheme.apply(
    displayColor: colorScheme.onPrimary,
    bodyColor: colorScheme.onPrimary,
  );

  final buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
  );
  const buttonPadding = EdgeInsets.symmetric(
    horizontal: 10,
    vertical: 10,
  );
  final buttonTextStyle = textTheme.titleSmall;

  final background = colorScheme.background;

  final divider = initialTheme.dividerColor;

  final inputDecorationTheme = InputDecorationTheme(
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    floatingLabelStyle: textTheme.titleSmall?.apply(color: Colors.black54),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 5,
    ),
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: colorScheme.onPrimary,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: colorScheme.onPrimaryContainer,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: Colors.black54,
        width: 2,
      ),
    ),
    hintStyle: textTheme.bodyMedium,
    labelStyle: textTheme.bodySmall!.copyWith(
      fontWeight: FontWeight.normal,
    ),
    // constraints: const BoxConstraints(maxHeight: 30),
  );
  return ThemeData(
      useMaterial3: initialTheme.useMaterial3,
      brightness: initialTheme.brightness,
      typography: initialTheme.typography,
      colorScheme: colorScheme,
      textTheme: textTheme,
      primaryTextTheme: primaryTextTheme,
      scaffoldBackgroundColor: colorScheme.background,
      disabledColor: _disabled,
      dividerTheme: DividerThemeData(
        color: divider,
        space: 1,
        thickness: 1,
      ),
      chipTheme: ChipThemeData(
        labelStyle: textTheme.labelSmall,
        side: const BorderSide(
          width: 0,
        ),
      ),
      cardTheme: CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          side: BorderSide(
            width: 1,
            color: divider,
          ),
        ),
        color: background,
        surfaceTintColor: Colors.transparent,
        margin: EdgeInsets.zero,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.tertiary,
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: background,
        surfaceTintColor: colorScheme.background,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        showDragHandle: false,
        surfaceTintColor: Colors.transparent,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     top: Radius.circular(20),
        //   ),
        // ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
      navigationRailTheme: const NavigationRailThemeData(
        labelType: NavigationRailLabelType.all,
        groupAlignment: 0,
      ),
      dialogTheme: DialogTheme(
        backgroundColor: colorScheme.background,
        surfaceTintColor: colorScheme.background,
        titleTextStyle: textTheme.titleLarge,
        contentTextStyle: textTheme.bodyLarge,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: initialTheme.brightness == Brightness.light ? _darker : _lightest,
        contentTextStyle: primaryTextTheme.bodyLarge,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: colorScheme.primary,
      ),
      inputDecorationTheme: inputDecorationTheme,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.secondary,
        foregroundColor: Colors.white,
        iconSize: 24,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          // shape: buttonShape,
          padding: buttonPadding,
          backgroundColor: colorScheme.secondary,
          foregroundColor: colorScheme.onSecondary,
          textStyle: textTheme.titleMedium,
          elevation: 10,
        ),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: inputDecorationTheme,
        textStyle: textTheme.bodyMedium,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: buttonShape,
          padding: buttonPadding,
          side: BorderSide(
            color: colorScheme.primary,
            width: 1,
          ),
          foregroundColor: colorScheme.primary,
          textStyle: buttonTextStyle,
          elevation: 0,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: buttonShape,
          padding: buttonPadding,
          foregroundColor: colorScheme.primary,
          textStyle: buttonTextStyle,
        ),
      ),

      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          backgroundColor: background,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary.withOpacity(0.75),
        centerTitle: true,
        surfaceTintColor: Colors.red,
      ));
}

TextTheme _getTextTheme(ColorScheme colorScheme, Brightness brightness) {
  final textColor = brightness == Brightness.light ? _darker : _lightest;
  final headlineColor = textColor;
  const headlineWeight = FontWeight.w900;
  const headlineHeight = 1.2;

  final titleColor = textColor;
  const titleWeight = FontWeight.bold;
  const titleHeight = 1.2;

  final bodyColor = textColor;
  const bodyWeight = FontWeight.normal;
  const bodyHeight = 1.5;

  final labelColor = titleColor;

  final textTheme = TextTheme(
    // Headline
    headlineLarge: TextStyle(
      fontSize: 24,
      height: headlineHeight,
      // letterSpacing: headlineLetterSpacing,
      color: headlineColor,
      fontWeight: headlineWeight,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      height: headlineHeight,
      // letterSpacing: headlineLetterSpacing,
      color: headlineColor,
      fontWeight: headlineWeight,
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      height: headlineHeight,
      // letterSpacing: headlineLetterSpacing,
      color: headlineColor,
      fontWeight: headlineWeight,
    ),

    // Title
    titleLarge: TextStyle(
      fontSize: 20,
      height: titleHeight,
      // letterSpacing: titleLetterSpacing,
      color: titleColor,
      fontWeight: titleWeight,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      height: titleHeight,
      // letterSpacing: titleLetterSpacing,
      color: titleColor,
      fontWeight: titleWeight,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      height: titleHeight,
      // letterSpacing: titleLetterSpacing,
      color: titleColor,
      fontWeight: titleWeight,
    ),

    // Body
    bodyLarge: TextStyle(
      fontSize: 16,
      height: bodyHeight,
      // letterSpacing: bodyLetterSpacing,
      color: bodyColor,
      fontWeight: bodyWeight,
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
      height: bodyHeight,
      // letterSpacing: bodyLetterSpacing,
      color: bodyColor,
      fontWeight: bodyWeight,
    ),
    bodySmall: TextStyle(
      fontSize: 10,
      height: bodyHeight,
      color: bodyColor,
      fontWeight: bodyWeight,
    ),

    // Label
    labelLarge: TextStyle(
      fontSize: 16,
      height: bodyHeight,
      // letterSpacing: bodyLetterSpacing,
      color: labelColor,
      fontWeight: bodyWeight,
    ),
    labelMedium: TextStyle(
      fontSize: 14,
      height: bodyHeight,
      // letterSpacing: bodyLetterSpacing,
      color: labelColor,
      fontWeight: bodyWeight,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      height: bodyHeight,
      // letterSpacing: bodyLetterSpacing,
      color: labelColor,
      fontWeight: bodyWeight,
    ),
  );

  return GoogleFonts.latoTextTheme(textTheme);
}
