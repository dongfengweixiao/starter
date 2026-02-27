import 'package:flutter/material.dart';
import 'package:flutter_it/flutter_it.dart';
import 'package:yaru/yaru.dart';

import '../../app/app_model.dart';
import '../../app_config.dart';
import '../../common/view/ui_constants.dart';
import '../../extensions/build_context_x.dart';
import '../../l10n/l10n.dart';

class AboutDialog extends StatelessWidget with WatchItMixin {
  const AboutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final l10n = context.l10n;
    final version = watchPropertyValue((AppModel m) => m.version);

    return AlertDialog(
      title: YaruDialogTitleBar(
        title: Text('${l10n.about} ${AppConfig.appTitle}'),
        border: BorderSide.none,
        backgroundColor: Colors.transparent,
      ),
      titlePadding: EdgeInsets.zero,
      content: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppConfig.appTitle,
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: kLargestSpace),
            Text('${l10n.version}: $version'),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.ok),
        ),
      ],
    );
  }
}
