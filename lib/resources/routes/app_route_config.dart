import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:society_app/resources/routes/screen/error_page.dart';
import 'package:society_app/resources/routes/screen/scaffold_with_navbar.dart';
import 'package:society_app/views/home_page/screen/homepage.dart';
import 'package:society_app/views/onboarding_screens/screen/extra.dart';
import 'package:society_app/views/onboarding_screens/screen/login.dart';
import 'app_route_constants.dart';
import 'navigation_observer.dart';

class AppRouter {
  static GoRouter returnRouter(bool isAuth) {
    /// Create keys for `root` & `section` navigator avoiding unnecessary rebuilds
    final _rootNavigatorKey = GlobalKey<NavigatorState>();
    // final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
    // final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
    final _shellNavigatorKey = GlobalKey<NavigatorState>();


    GoRouter routerConfig = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/',
      debugLogDiagnostics: true,
      observers: [
        MyNavigatorObserver(),
      ],
      routes: [

        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state, child) {
            print(state.matchedLocation);
            return NoTransitionPage(
                child: ScaffoldWithNavBar(
                  location: state.matchedLocation,
                  child: child,
                ));
          },
          routes: [
            GoRoute(
              name: MyAppRouteConstants.homeRouteName,
              path: '/',
              pageBuilder: (context, state) {
                return const MaterialPage(child: HomePage());
              },
              routes: <RouteBase>[ // Add child routes
                GoRoute(
                    path: 'login', // NOTE: Don't need to specify "/" character for router’s parents
                    pageBuilder: (context, state) {
                      return const MaterialPage(child: Login());
                    }
                ),
              ],
            ),
            GoRoute(
              path: '/extra',
                pageBuilder: (context, state) {
                  return const MaterialPage(child: Extra());
                }
            ),
            GoRoute(
                path: '/extra',
                pageBuilder: (context, state) {
                  return const MaterialPage(child: Extra());
                }
            ),
            GoRoute(
                path: '/extra',
                pageBuilder: (context, state) {
                  return const MaterialPage(child: Extra());
                }
            ),

          ],
        ),

        ///parent has multiple child
        // GoRoute(
        //     name: MyAppRouteConstants.homeRouteName,
        //     path: '/',
        //     pageBuilder: (context, state) {
        //       return const MaterialPage(child: HomePage());
        //     },
        //   routes: <RouteBase>[ // Add child routes
        //     GoRoute(
        //       path: 'login', // NOTE: Don't need to specify "/" character for router’s parents
        //         pageBuilder: (context, state) {
        //           return const MaterialPage(child: Login());
        //         }
        //     ),
        //   ],
        // ),


        ///parent has no child
        // GoRoute(
        //           name: 'login',
        //           path: '/login',
        //           pageBuilder: (context, state) {
        //             return const MaterialPage(child: Login());
        //           }),


        // StatefulShellRoute.indexedStack(
        //   builder: (context, state, navigationShell) {
        //     /// Return the widget that implements the custom shell (e.g a BottomNavigationBar).
        //     /// The [StatefulNavigationShell] is passed to be able to navigate to other branches in a stateful way.
        //     return ScaffoldWithNavbar(navigationShell);
        //   },
        //   branches: [
        //
        //
        //     /// The route branch for the 1º Tab
        //     StatefulShellBranch(
        //       navigatorKey: _shellNavigatorAKey,
        //       // Add this branch routes
        //       // each routes with its sub routes if available e.g feed/uuid/details
        //       routes: [
        //         GoRoute(
        //             name: MyAppRouteConstants.homeRouteName,
        //             path: '/',
        //             pageBuilder: (context, state) {
        //               return const MaterialPage(child: HomePage());
        //             }),
        //       ],
        //     ),
        //
        //
        //
        //     /// The route branch for 2º Tab
        //     StatefulShellBranch(
        //       navigatorKey: _shellNavigatorBKey,
        //         routes: [
        //       // Add this branch routes
        //       // each routes with its sub routes if available e.g shope/uuid/details
        //       GoRoute(
        //           name: 'login',
        //           path: '/login',
        //           pageBuilder: (context, state) {
        //             return const MaterialPage(child: Login());
        //           }),
        //     ],
        //     ),
        //
        //
        //
        //   ],
        // ),
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
