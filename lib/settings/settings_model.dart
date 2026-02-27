import 'dart:async';

import 'package:safe_change_notifier/safe_change_notifier.dart';

import 'shared_preferences_keys.dart';
import 'settings_service.dart';

class SettingsModel extends SafeChangeNotifier {
  SettingsModel({
    required SettingsService service,
  }) : _service = service {
    _propertiesChangedSub ??= _service.propertiesChanged.listen(
      (_) => notifyListeners(),
    );
  }

  final SettingsService _service;

  int _scrollIndex = 0;
  int get scrollIndex => _scrollIndex;
  set scrollIndex(int value) {
    _scrollIndex = value;
    notifyListeners();
  }

  StreamSubscription<bool>? _propertiesChangedSub;

  int get themeIndex => _service.getInt(SPKeys.themeIndex) ?? 0;
  void setThemeIndex(int value) => _service.setValue(SPKeys.themeIndex, value);

  bool get useYaruTheme => _service.getBool(SPKeys.useYaruTheme) ?? false;
  void setUseYaruTheme(bool value) =>
      _service.setValue(SPKeys.useYaruTheme, value);

  int? get customThemeColor => _service.getInt(SPKeys.customThemeColor);
  void setCustomThemeColor(int? value) =>
      _service.setValue(SPKeys.customThemeColor, value);
  bool get useCustomThemeColor =>
      _service.getBool(SPKeys.useCustomThemeColor) ?? false;
  void setUseCustomThemeColor(bool value) =>
      _service.setValue(SPKeys.useCustomThemeColor, value);

  int get iconSetIndex => _service.getInt(SPKeys.iconSetIndex) ?? 0;
  void setIconSetIndex(int value) =>
      _service.setValue(SPKeys.iconSetIndex, value);

  bool get useMoreAnimations =>
      _service.getBool(SPKeys.useMoreAnimations) ?? false;
  void setUseMoreAnimations(bool value) =>
      _service.setValue(SPKeys.useMoreAnimations, value);

  bool get saveWindowSize => _service.getBool(SPKeys.saveWindowSize) ?? false;
  void setSaveWindowSize(bool value) =>
      _service.setValue(SPKeys.saveWindowSize, value);

  @override
  Future<void> dispose() async {
    await _propertiesChangedSub?.cancel();
    super.dispose();
  }
}
