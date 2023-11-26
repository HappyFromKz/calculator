import 'package:calculator/profile/profile_api_client/api_service.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dio/dio.dart';


void main() {
  group('ApiService Tests', () {
    late Dio dio;
    late ApiService apiService;

    setUp(() {
      dio = Dio(); 
      apiService = ApiService(dio);
    });

    test('getPosts returns a list of posts', () async {
      dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          if (options.path == '/posts' && options.method == 'GET') {
            handler.resolve(Response(requestOptions: options, data: [
              {'id': 1,
               'title': 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
                'body': 'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto'}
            ]));
          } else {
            handler.next(options);
          }
        },
      ));

      final posts = await apiService.getPosts();

      expect(posts, isNotEmpty);
      expect(posts.length, 100); 
      expect(posts[0].id, 1);
      expect(posts[0].title, 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit');
      // expect(posts[0].body, 'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto');
    });
  });
}
