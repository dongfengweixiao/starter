import 'package:flutter/material.dart';
import 'package:flutter_it/flutter_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';

import 'app/app_model.dart';
import 'app/view/routing_manager.dart';
import 'app/window_size_to_settings_listener.dart';
import 'app_config.dart';
import 'settings/settings_model.dart';
import 'settings/settings_service.dart';
import 'settings/view/licenses_dialog.dart';

/// Registers all Services, ViewModels and external dependencies
void registerDependencies() {
  if (AppConfig.windowManagerImplemented) {
    di.registerSingletonAsync<WindowManager>(() async {
      final wm = WindowManager.instance;
      await wm.ensureInitialized();
      await wm.waitUntilReadyToShow(
        const WindowOptions(
          backgroundColor: Colors.transparent,
          minimumSize: Size(500, 700),
          skipTaskbar: false,
          titleBarStyle: TitleBarStyle.hidden,
        ),
        () async {
          await windowManager.show();
          await windowManager.focus();
        },
      );

      return wm;
    });
  }

  di
    ..registerSingletonAsync<SharedPreferences>(SharedPreferences.getInstance)
    ..registerSingletonAsync<PackageInfo>(PackageInfo.fromPlatform)
    ..registerSingletonAsync<SettingsService>(
      () async {
        return SettingsService(sharedPreferences: di<SharedPreferences>());
      },
      dependsOn: [SharedPreferences],
      dispose: (s) async => s.dispose(),
    );

  if (AppConfig.windowManagerImplemented) {
    di.registerSingletonAsync<WindowSizeToSettingsListener>(
      () async => WindowSizeToSettingsListener.register(
        sharedPreferences: di<SharedPreferences>(),
        windowManager: di<WindowManager>(),
      ),
      dispose: (s) => s.dispose(),
      dependsOn: [SharedPreferences, WindowManager],
    );
  }

  di
    ..registerSingletonWithDependencies<SettingsModel>(
      () => SettingsModel(service: di<SettingsService>()),
      dependsOn: [SettingsService],
      dispose: (s) => s.dispose(),
    )
    ..registerSingletonAsync<AppModel>(
      () async {
        final appModel = AppModel(packageInfo: di<PackageInfo>());
        return appModel;
      },
      dependsOn: [PackageInfo],
      dispose: (s) => s.dispose(),
    )
    ..registerSingleton<RoutingManager>(RoutingManager())
    ..registerSingleton<LicenseStore>(LicenseStore());
}
