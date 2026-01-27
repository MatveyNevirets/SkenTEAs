import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skenteas/core/consts/error_messages.dart';
import 'package:skenteas/feature/profile/presentation/bloc/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is UserFetchedState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Profile"),
                  Text("Id: ${state.user.id}"),
                  Text("Username: ${state.user.username}"),
                ],
              );
            } else if (state is ProfileErrorState) {
              return Center(child: Text(AppMessages.somethingWrong));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
