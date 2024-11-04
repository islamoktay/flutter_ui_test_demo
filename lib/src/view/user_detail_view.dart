import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import 'package:flutter_ui_test_demo/app/service/launch_service.dart';
import 'package:flutter_ui_test_demo/src/model/user_model.dart';

@RoutePage()
class UserDetailView extends StatelessWidget {
  const UserDetailView({
    required this.user,
    super.key,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name ?? 'NO NAME'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user.address?.city ?? ''}/${user.address?.street ?? ''}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 30),
            Text(user.address?.zipcode ?? ''),
            Text(user.phone ?? ''),
            Text(user.email ?? ''),
            Semantics(
              identifier: 'website',
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async =>
                    LaunchService.launchWebsite('https://${user.website}'),
                child: Text(
                  user.website ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(decoration: TextDecoration.underline),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(user.company?.name ?? ''),
          ],
        ),
      ),
    );
  }
}
