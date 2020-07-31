import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'app_config.dart';

void main() {
  AppConfig().setAppConfig(
    description: 'development',
    dio: Dio(BaseOptions(
      baseUrl: 'https://my-json-server.typicode.com/thailemeetai',
      connectTimeout: 5000,
      receiveTimeout: 5000,
    )),
    appEnvironment: AppEnvironment.DEV,
  );
  runApp(MyApp());
}
