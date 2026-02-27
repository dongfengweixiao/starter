import 'package:flutter/material.dart';
import 'package:flutter_it/flutter_it.dart';

import '../app_model.dart';
import 'master_detail_page.dart';

class DesktopHomePage extends StatefulWidget with WatchItStatefulWidgetMixin {
  const DesktopHomePage({super.key});

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  @override
  Widget build(BuildContext context) {
    final isInFullWindowMode = watchPropertyValue(
      (AppModel m) => m.fullWindowMode ?? false,
    );

    return Scaffold(
      body: isInFullWindowMode
          ? const Center(child: Text('Full Window Mode'))
          : const MasterDetailPage(),
    );
  }
}
