import 'package:flutter/material.dart';
import 'package:flutter_it/flutter_it.dart';
import 'package:yaru/yaru.dart';

import '../../common/view/global_keys.dart';
import '../../common/view/ui_constants.dart';
import 'master_item.dart';
import 'routing_manager.dart';

class MasterTileWithPageId extends StatelessWidget {
  const MasterTileWithPageId({
    super.key,
    required this.item,
    required this.selectedPageId,
  });

  final MasterItem item;
  final String? selectedPageId;

  @override
  Widget build(BuildContext context) => MasterTile(
    key: ValueKey(item.pageId),
    onTap: () => di<RoutingManager>().push(pageId: item.pageId),
    pageId: item.pageId,
    leading: item.iconBuilder(selectedPageId == item.pageId),
    title: item.titleBuilder(context),
    subtitle: item.subtitleBuilder?.call(context),
    selected: selectedPageId == item.pageId,
  );
}

class MasterTile extends StatelessWidget {
  const MasterTile({
    super.key,
    this.selected,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    required this.pageId,
    required this.onTap,
  });

  final bool? selected;
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final String pageId;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kSmallestSpace),
      child: YaruMasterTile(
        title: title,
        onTap: () {
          masterScaffoldKey.currentState
            ?..closeEndDrawer()
            ..closeDrawer();
          onTap();
        },
        selected: selected,
        leading: leading,
        subtitle: subtitle,
        trailing: trailing,
      ),
    );
  }
}
