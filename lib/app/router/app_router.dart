import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import 'package:flutter_ui_test_demo/src/model/user_model.dart';
import 'package:flutter_ui_test_demo/src/view/base_view.dart';
import 'package:flutter_ui_test_demo/src/view/posts_view.dart';
import 'package:flutter_ui_test_demo/src/view/splash_view.dart';
import 'package:flutter_ui_test_demo/src/view/user_detail_view.dart';
import 'package:flutter_ui_test_demo/src/view/users_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(
          page: BaseRoute.page,
          children: [
            AutoRoute(page: UsersRoute.page, initial: true),
            AutoRoute(page: PostsRoute.page),
          ],
        ),
        AutoRoute(page: UserDetailRoute.page),
      ];
}
