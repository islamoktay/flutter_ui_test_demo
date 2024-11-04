import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ui_test_demo/src/blocs/post_cubit/post_cubit.dart';
import 'package:flutter_ui_test_demo/src/repository/remote_data_repo.dart';
import 'package:flutter_ui_test_demo/src/widgets/error_text.dart';
import 'package:flutter_ui_test_demo/src/widgets/loading_body.dart';

@RoutePage()
class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        title: const Text('POSTS'),
      ),
      body: BlocProvider(
        create: (context) => PostCubit(RemoteDataRepo())..getPosts(),
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            return state.map(
              data: (data) => data.posts == null
                  ? const ErrorText()
                  : ListView.separated(
                      padding: const EdgeInsets.all(16),
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemCount: data.posts!.length,
                      itemBuilder: (context, index) => Semantics(
                        identifier: 'post${data.posts![index]}',
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          title: Text(
                            data.posts![index].title ?? '',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          tileColor: Colors.redAccent.withOpacity(.1),
                          subtitle: Text(data.posts![index].body ?? ''),
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
