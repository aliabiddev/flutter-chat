import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_quickstart/cubits/app_user/app_user_cubit.dart';
import 'package:supabase_quickstart/utils/constants.dart';

/// Widget that will display a user's avatar
class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppUserCubit, AppUserState>(
      builder: (context, state) {
        if (state is AppUserLoaded) {
          final user = state.appUsers[userId];
          return CircleAvatar(
            child: user == null ? preloader : Text(user.name.substring(0, 2)),
          );
        } else {
          return const CircleAvatar(child: preloader);
        }
      },
    );
  }
}
