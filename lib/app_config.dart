import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

enum AppEnvironment { DEV, PROD }

class AppConfig {
  // Singleton object
  factory AppConfig() {
    return _singleton;
  }

  AppConfig._internal();
  static final AppConfig _singleton = AppConfig._internal();

  AppEnvironment appEnvironment;
  String appName;
  String description;
  ThemeData themeData;
  Dio dio;

  // Set app configuration with single function
  void setAppConfig(
      {AppEnvironment appEnvironment,
      String appName,
      String description,
      String baseUrl,
      ThemeData themeData,
      Dio dio}) {
    this.appEnvironment = appEnvironment;
    this.appName = appName;
    this.description = description;
    this.themeData = themeData;
    this.dio = dio;
  }
}
