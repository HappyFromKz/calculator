import 'package:calculator/profile/profile_model/profile_model.dart';
import 'package:calculator/profile/profile_repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
    final ProfileRepository _profileRepository;

  ProfileBloc(this._profileRepository) : super(ProfileLoading()) {
    on<LoadPostsEvent>(_profileRepository.getPostsData);
  }
}
