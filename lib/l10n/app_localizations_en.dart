// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get home => 'Home';

  @override
  String get settings => 'Settings';

  @override
  String get about => 'About';

  @override
  String get theme => 'Theme';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get system => 'System';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancel';

  @override
  String get useYaruThemeTitle => 'Use Yaru theme';

  @override
  String get useYaruThemeDescription =>
      'Use the Yaru theme for the application.';

  @override
  String get selectIconThemeTitle => 'Select icon theme';

  @override
  String get selectIconThemeDescription =>
      'Choose an icon theme for the application.';

  @override
  String get useCustomThemeColorTitle => 'Use custom accent color';

  @override
  String get useCustomThemeColorDescription =>
      'Use a custom accent color for the current theme.';

  @override
  String get selectColor => 'Select color';

  @override
  String get selectColorShade => 'Select color shade';

  @override
  String get selectColorAndItsShades => 'Select a color and its shades';

  @override
  String get version => 'Version';

  @override
  String get contributors => 'Contributors';

  @override
  String get license => 'License';

  @override
  String get dependencies => 'Dependencies';
}
