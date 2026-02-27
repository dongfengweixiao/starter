import 'package:flutter/material.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

import '../../common/logging.dart';
import '../../common/page_ids.dart';
import '../../extensions/target_platform_x.dart';
import 'mobile_page.dart';

class RoutingManager extends SafeChangeNotifier implements NavigatorObserver {
  RoutingManager();

  String? _selectedPageId = PageIDs.homePage;
  String? get selectedPageId => _selectedPageId;
  void _setSelectedPageId(String pageId) {
    _selectedPageId = pageId;
    notifyListeners();
  }

  bool isPageInLibrary(String? pageId) => PageIDs.permanent.contains(pageId);

  Future<void> push({
    required String pageId,
    Widget Function(BuildContext context)? builder,
    bool maintainState = false,
    bool replace = false,
  }) async {
    final inLibrary = isPageInLibrary(pageId);
    assert(inLibrary || builder != null);
    if (selectedPageId == pageId && !replace) {
      return;
    }
    if (inLibrary) {
      if (replace || PageIDs.replacers.contains(pageId)) {
        await _masterNavigatorKey.currentState?.pushReplacementNamed(pageId);
      } else {
        await _masterNavigatorKey.currentState?.pushNamed(pageId);
      }
    } else if (builder != null) {
      final materialPageRoute = PageRouteBuilder(
        maintainState: maintainState,
        settings: RouteSettings(name: pageId),
        pageBuilder: (context, __, ___) =>
            isMobile ? MobilePage(page: builder(context)) : builder(context),
      );

      if (replace) {
        await _masterNavigatorKey.currentState?.pushReplacement(
          materialPageRoute,
        );
      } else {
        await _masterNavigatorKey.currentState?.push(materialPageRoute);
      }
    }
  }

  void pop() {
    if (!PageIDs.replacers.contains(selectedPageId)) {
      _masterNavigatorKey.currentState?.maybePop();
    } else {
      _masterNavigatorKey.currentState?.popUntil(
        (route) => route.settings.name == selectedPageId,
      );
    }
  }

  bool get canPop => PageIDs.replacers.contains(selectedPageId)
      ? false
      : _masterNavigatorKey.currentState?.canPop() == true;

  @override
  void didPop(Route route, Route? previousRoute) {
    final pageId = previousRoute?.settings.name;

    printMessageInDebugMode(
      'didPop: ${route.settings.name}, previousPageId: ${previousRoute?.settings.name}',
    );
    if (pageId == null) return;
    _setSelectedPageId(pageId);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    final pageId = route.settings.name;
    printMessageInDebugMode(
      'didPush: $pageId, previousPageId: ${previousRoute?.settings.name}',
    );
    if (pageId == null) return;
    _setSelectedPageId(pageId);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    final pageId = route.settings.name;
    printMessageInDebugMode(
      'didRemove: $pageId, previousPageId: ${previousRoute?.settings.name}',
    );
    if (pageId == null) return;
    _setSelectedPageId(pageId);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    printMessageInDebugMode(
      'didReplace: ${oldRoute?.settings.name}, newPageId: ${newRoute?.settings.name}',
    );
    final pageId = newRoute?.settings.name;
    if (pageId == null) return;
    _setSelectedPageId(pageId);
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    printMessageInDebugMode(
      'didStartUserGesture: ${route.settings.name}, previousPageId: ${previousRoute?.settings.name}',
    );
  }

  @override
  void didStopUserGesture() {
    printMessageInDebugMode('didStopUserGesture');
  }

  @override
  void didChangeTop(Route topRoute, Route? previousTopRoute) {
    printMessageInDebugMode('didChangeTop');
  }

  // Note: Navigator.initState ensures assert(observer.navigator == null);
  // Afterwards the Navigator itself!!! sets the navigator of its observers...
  @override
  NavigatorState? get navigator => null;
  final GlobalKey<NavigatorState> _masterNavigatorKey =
      GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get masterNavigatorKey => _masterNavigatorKey;
}
