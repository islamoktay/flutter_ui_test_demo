import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ui_test_demo/app/router/app_router.dart';
import 'package:flutter_ui_test_demo/src/blocs/users_cubit/users_cubit.dart';
import 'package:flutter_ui_test_demo/src/repository/remote_data_repo.dart';
import 'package:flutter_ui_test_demo/src/widgets/error_text.dart';
import 'package:flutter_ui_test_demo/src/widgets/loading_body.dart';

@RoutePage()
class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        title: const Text('USERS'),
      ),
      body: BlocProvider(
        create: (context) => UsersCubit(RemoteDataRepo())..getUsers(),
        child: BlocBuilder<UsersCubit, UsersState>(
          builder: (context, state) {
            return state.map(
              data: (data) => data.users == null
                  ? const ErrorText()
                  : ListView.separated(
                      padding: const EdgeInsets.all(16),
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemCount: data.users!.length,
                      itemBuilder: (context, index) => Semantics(
                        identifier: 'users$index',
                        child: ListTile(
                          onTap: () => context.router
                              .push(UserDetailRoute(user: data.users![index])),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          title: Text(
                            data.users![index].name ?? '',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          tileColor: Colors.redAccent.withOpacity(.1),
                          subtitle:
                              Text(data.users![index].company?.name ?? ''),
                        ),
                      ),
                    ),
              error: (value) => const ErrorText(),
              loading: (_) => const LoadingBody(),
            );
          },
        ),
      ),
    );
  }
}
