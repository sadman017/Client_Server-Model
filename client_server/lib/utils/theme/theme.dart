
import 'package:client_server/utils/widget_theme/elevated_button.dart';
import 'package:client_server/utils/widget_theme/outlined_button.dart';
import 'package:client_server/utils/widget_theme/text_field_theme.dart';
import 'package:client_server/utils/widget_theme/text_theme.dart';
import 'package:flutter/material.dart';
class AppTheme{
  AppTheme._();
  static  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    );
  static ThemeData darkTheme = ThemeData(brightness: Brightness.dark,
   textTheme: TTextTheme.darkTextTheme,
   elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
   floatingActionButtonTheme: const FloatingActionButtonThemeData(),
   outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
   inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}