// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get home => '主页';

  @override
  String get settings => '设置';

  @override
  String get about => '关于';

  @override
  String get theme => '主题';

  @override
  String get light => '浅色';

  @override
  String get dark => '深色';

  @override
  String get system => '跟随系统';

  @override
  String get ok => '确定';

  @override
  String get cancel => '取消';

  @override
  String get useYaruThemeTitle => '使用 Yaru 主题';

  @override
  String get useYaruThemeDescription => '为应用程序使用 Yaru 主题。';

  @override
  String get selectIconThemeTitle => '选择图标主题';

  @override
  String get selectIconThemeDescription => '为应用程序选择一个图标主题。';

  @override
  String get useCustomThemeColorTitle => '使用自定义强调色';

  @override
  String get useCustomThemeColorDescription => '为当前主题使用自定义强调色。';

  @override
  String get selectColor => '选择颜色';

  @override
  String get selectColorShade => '选择颜色色度';

  @override
  String get selectColorAndItsShades => '选择一个颜色及其色度';

  @override
  String get version => '版本';

  @override
  String get contributors => '贡献者';

  @override
  String get license => '许可证';

  @override
  String get dependencies => '依赖';
}
