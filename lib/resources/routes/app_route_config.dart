

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:society_app/views/home_page/screen/homepage.dart';
import 'package:society_app/views/onboarding_screens/screen/login.dart';
import 'app_route_constants.dart';


class AppRouter {

  GoRouter routerConfig =GoRouter(
      routes: [
        GoRoute(
          name: MyAppRouteConstants.homeRouteName,
            path: '/',
            pageBuilder: (context, state) {
            return const MaterialPage(
                child: HomePage());
            }
        ),
        GoRoute(
            name: 'login',
            path: '/Login',
            pageBuilder: (context, state) {
              return const MaterialPage(
                  child: Login());
            }
        ),

      ]
  );

}

