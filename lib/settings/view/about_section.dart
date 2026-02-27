import 'package:flutter/material.dart' hide AboutDialog, LicensePage;
import 'package:flutter_it/flutter_it.dart';
import 'package:yaru/yaru.dart';

import '../../app/app_model.dart';
import '../../app_config.dart';
import '../../common/view/ui_constants.dart';
import '../../l10n/l10n.dart';
import 'about_page.dart';
import 'licenses_dialog.dart';

class AboutSection extends StatelessWidget with WatchItMixin {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final text = '${context.l10n.about} ${AppConfig.appTitle}';
    return YaruSection(
      headline: Text(text),
      margin: const EdgeInsets.all(kLargestSpace),
      child: const Column(children: [_AboutTile(), _LicenseTile()]),
    );
  }
}

class _AboutTile extends StatelessWidget with WatchItMixin {
  const _AboutTile();

  @override
  Widget build(BuildContext context) {
    final currentVersion = watchPropertyValue((AppModel m) => m.version);

    return YaruTile(
      title: Text('${context.l10n.version}: $currentVersion'),
      trailing: OutlinedButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => const AboutDialog(),
        ),
        child: Text(context.l10n.contributors),
      ),
    );
  }
}

class _LicenseTile extends StatelessWidget {
  const _LicenseTile();

  @override
  Widget build(BuildContext context) {
    return YaruTile(
      title: Text('${context.l10n.license}: GPL3'),
      trailing: OutlinedButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => const LicensesDialog(),
        ),
        child: Text(context.l10n.dependencies),
      ),
      enabled: true,
    );
  }
}
