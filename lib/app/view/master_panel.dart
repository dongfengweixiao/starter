import 'package:flutter/material.dart';
import 'package:flutter_it/flutter_it.dart';
import 'package:yaru/yaru.dart';

import '../../app_config.dart';
import '../../common/view/header_bar.dart';
import '../../common/view/ui_constants.dart';
import 'create_master_items.dart';
import 'master_tile.dart';
import 'routing_manager.dart';

class MasterPanel extends StatelessWidget {
  const MasterPanel({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox(
    width: kMasterDetailSideBarWidth,
    child: Column(
      children: [
        HeaderBar(
          includeBackButton: false,
          includeSidebarButton: false,
          backgroundColor: Colors.transparent,
          style: YaruTitleBarStyle.undecorated,
          adaptive: false,
          title: Text(AppConfig.appTitle),
        ),
        Expanded(child: MasterList()),
      ],
    ),
  );
}

class MasterList extends StatelessWidget with WatchItMixin {
  const MasterList({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedPageId = watchPropertyValue(
      (RoutingManager m) => m.selectedPageId,
    );

    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverList.builder(
                itemCount: permanentMasterItems.length,
                itemBuilder: (context, index) => MasterTileWithPageId(
                  item: permanentMasterItems.elementAt(index),
                  selectedPageId: selectedPageId,
                ),
              ),
            ],
          ),
        ),
        if (settingsMasterItem != null)
          MasterTileWithPageId(
            item: settingsMasterItem!,
            selectedPageId: selectedPageId,
          ),
      ],
    );
  }
}
