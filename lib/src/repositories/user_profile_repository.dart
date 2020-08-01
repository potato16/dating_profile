import 'package:dating_profile/app_config.dart';
import 'package:dating_profile/src/models/user_profile.dart';
import 'package:dio/dio.dart';

class UserProfileRepository {
  final Dio dio = AppConfig().dio;
  Future<UserProfile> getUserProfile() async {
    Response<dynamic> response;
    try {
      response = await dio.get<Map<String, dynamic>>('/mobile-assignment/db');
    } on DioError catch (e) {
      response = e.response;
    }
    if (response == null) {
      return null;
    }
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return UserProfile.fromJson(response.data as Map<String, dynamic>);
    }
    return null;
  }
}
