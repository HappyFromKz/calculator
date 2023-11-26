part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final List<Post> posts;
  ProfileSuccess(this.posts);
}

final class ProfileError extends ProfileState {
  final String error;
  ProfileError(this.error);
}
