import 'package:flutter/material.dart';
import 'package:flutter_it/flutter_it.dart';

import '../../extensions/build_context_x.dart';
import 'mobile_navigation_bar.dart';

class MobileBottomBar extends StatelessWidget with WatchItMixin {
  const MobileBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return SizedBox(
      width: context.mediaQuerySize.width,
      child: Material(
        color: theme.cardColor,
        child: const MobileNavigationBar(),
      ),
    );
  }
}
