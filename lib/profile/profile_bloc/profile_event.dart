part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class LoadPostsEvent extends ProfileEvent{}
