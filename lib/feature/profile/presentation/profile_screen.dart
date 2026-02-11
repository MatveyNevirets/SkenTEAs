import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skenteas/core/consts/color_consts.dart';
import 'package:skenteas/feature/profile/presentation/bloc/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is UserFetchedState) {
            Uint8List? imageBytes = state.userModel.imageBytes;
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 100),
                  Text("Profile"),
                  Text("Is admin? ${state.userModel.isAdmin}"),
                  Text("Username: ${state.userModel.username}"),
                  CircleAvatar(
                    radius: imageBytes != null ? 100 : 50,
                    backgroundColor: obsoleteSecondaryColor,
                    foregroundImage: imageBytes != null
                        ? MemoryImage(imageBytes)
                        : null,
                    child: imageBytes == null
                        ? Icon(
                            Icons.photo_camera_outlined,
                            size: 64,
                            color: headerTextColor,
                          )
                        : null,
                  ),
                  state.userModel.isAdmin
                      ? Text("Все посты в очереди на подтверждение:")
                      : SizedBox(),
                  state.userModel.isAdmin
                      ? SizedBox(
                          height: 1000,
                          child: ListView.builder(
                            itemCount: state.posts?.length ?? 0,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Card(
                                  color: Colors.green,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text(
                                            state.posts![index].title,
                                          ),
                                          subtitle: Text(
                                            state.posts![index].description,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: ElevatedButton(
                                                onPressed: () => context
                                                    .read<ProfileBloc>()
                                                    .add(
                                                      PublishPostEvent(
                                                        post:
                                                            state.posts![index],
                                                      ),
                                                    ),
                                                child: Text("Опубликовать"),
                                              ),
                                            ),
                                            Expanded(child: SizedBox()),
                                            Expanded(
                                              flex: 4,
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                child: Text("Отклонить"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            );
          } else if (state is ProfileErrorState) {
            return Center(child: Text("Что-то пошло не так :("));
          }
          return Center(child: CircularProgressIndicator());
        },
        listener: (BuildContext context, ProfileState state) {
          if (state is SuccessPublishedProfileState) {
            context.read<ProfileBloc>().add(FetchUserEvent());
          }
        },
      ),
    );
  }
}
