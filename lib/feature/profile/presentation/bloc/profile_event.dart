part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class FetchUserEvent extends ProfileEvent {}
