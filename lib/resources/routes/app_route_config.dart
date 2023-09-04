import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:society_app/resources/routes/screen/error_page.dart';
import 'package:society_app/resources/routes/screen/scaffold_with_navbar.dart';
import 'package:society_app/views/home_page/screen/homepage.dart';
import 'package:society_app/views/onboarding_screens/screen/login.dart';
import 'app_route_constants.dart';
import 'navigation_observer.dart';

class AppRouter {
  static GoRouter returnRouter(bool isAuth) {
    /// Create keys for `root` & `section` navigator avoiding unnecessary rebuilds
    final _rootNavigatorKey = GlobalKey<NavigatorState>();
    final _sectionNavigatorKey = GlobalKey<NavigatorState>();

    GoRouter routerConfig = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/',
      observers: [
        MyNavigatorObserver(),
      ],
      routes: <RouteBase>[
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            /// Return the widget that implements the custom shell (e.g a BottomNavigationBar).
            /// The [StatefulNavigationShell] is passed to be able to navigate to other branches in a stateful way.
            return ScaffoldWithNavbar(navigationShell);
          },
          branches: [
            /// The route branch for the 1º Tab
            StatefulShellBranch(
              navigatorKey: _sectionNavigatorKey,
              // Add this branch routes
              // each routes with its sub routes if available e.g feed/uuid/details
              routes: <RouteBase>[
                GoRoute(
                    name: MyAppRouteConstants.homeRouteName,
                    path: '/',
                    pageBuilder: (context, state) {
                      return const MaterialPage(child: HomePage());
                    }),
              ],
            ),
            /// The route branch for 2º Tab
            StatefulShellBranch(
                routes: <RouteBase>[
              // Add this branch routes
              // each routes with its sub routes if available e.g shope/uuid/details
              GoRoute(
                  name: 'login',
                  path: '/login',
                  pageBuilder: (context, state) {
                    return const MaterialPage(child: Login());
                  }),
            ],
            ),
          ],
        ),
      ],
      errorPageBuilder: (context, state) {
        return const MaterialPage(child: ErrorPage());
      },

      ///Had to change OR operator with AND after implementing proper conditions
      redirect: (context, state) {
        if (!isAuth ||
            state.matchedLocation
                .startsWith('/${MyAppRouteConstants.profileRouteName}')) {
          return context.namedLocation(MyAppRouteConstants.contactUsRouteName);
        } else {
          return null;
        }
      },
    );

    return routerConfig;
  }
}
