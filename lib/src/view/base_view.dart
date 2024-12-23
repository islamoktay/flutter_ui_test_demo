import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import 'package:flutter_ui_test_demo/app/router/app_router.dart';

@RoutePage()
class BaseView extends StatelessWidget {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        UsersRoute(),
        PostsRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              BottomNavigationBarItem(
                icon: Semantics(
                  identifier: 'users-tab',
                  child: const Icon(Icons.person),
                ),
                label: 'users',
              ),
              BottomNavigationBarItem(
                icon: Semantics(
                  identifier: 'posts-tab',
                  child: const Icon(Icons.feed),
                ),
                label: 'posts',
              ),
            ],
          ),
          body: child,
        );
      },
    );
  }
}
