import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/tab_page.dart';
import 'package:flutter_practice/pages/web_view_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.tab:
        return pageRoute(const TabPage(), settings: settings);
      case RoutePath.webViewPage:
        return pageRoute(const WebViewPage(), settings: settings);
      default:
        return pageRoute(Scaffold(
          body: SafeArea(
            child: Center(
              child: Text('Route page: ${settings.name} not found'),
            ),
          ),
        ));
    }
  }

  static MaterialPageRoute pageRoute(
    Widget page, {
    RouteSettings? settings,
    bool? maintainState,
    bool? fullscreenDialog,
    bool? allowSnapshotting,
    bool? barrierDismissible,
  }) =>
      MaterialPageRoute(
        builder: (context) => page,
        settings: settings,
        allowSnapshotting: allowSnapshotting ?? true,
        barrierDismissible: barrierDismissible ?? false,
        fullscreenDialog: fullscreenDialog ?? false,
        maintainState: maintainState ?? true,
      );
}

class RoutePath {
  static const String tab = '/';
  static const String webViewPage = '/web_view_page';
}
