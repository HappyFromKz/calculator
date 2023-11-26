import 'package:calculator/profile/profile_api_client/api_service.dart';
import 'package:calculator/profile/profile_bloc/profile_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileRepository {
  final apiService = ApiService(Dio(BaseOptions(contentType: 'application/json')));
  
  Future<void> getPostsData(ProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      final posts = await apiService.getPosts();
      print('posts $posts');
      emit(ProfileSuccess(posts));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
 }