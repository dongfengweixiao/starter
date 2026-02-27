import 'package:flutter/material.dart';

import '../../common/page_ids.dart';
import '../../common/view/header_bar.dart';
import '../../common/view/icons.dart';
import '../../l10n/l10n.dart';
import '../../settings/view/settings_page.dart';
import 'master_item.dart';

Iterable<MasterItem> getAllMasterItems() => [
      ...permanentMasterItems,
      if (settingsMasterItem != null) settingsMasterItem!,
    ];

Iterable<MasterItem> permanentMasterItems = [
  MasterItem(
    titleBuilder: (context) => Text(context.l10n.home),
    iconBuilder: (selected) => Icon(selected ? Iconz.homeFilled : Iconz.home),
    pageBuilder: (_) => const HomePage(),
    pageId: PageIDs.homePage,
  ),
];

MasterItem? settingsMasterItem = MasterItem(
  titleBuilder: (context) => Text(context.l10n.settings),
  iconBuilder: (selected) =>
      Icon(selected ? Iconz.settingsFilled : Iconz.settings),
  pageBuilder: (_) => const SettingsPage(),
  pageId: PageIDs.settings,
);

/// A simple home page for the template app
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderBar(
        adaptive: true,
        title: Text(context.l10n.home),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Flutter App Template',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              Text(
                'A minimal Flutter app template with:',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('• SafeChangeNotifier + Provider state management'),
                  Text('• flutter_it dependency injection'),
                  Text('• Platform adaptation (desktop/mobile)'),
                  Text('• Modular architecture (Service/Model pattern)'),
                  Text('• Internationalization (ARB files)'),
                  Text('• Yaru + Material dual theme support'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
