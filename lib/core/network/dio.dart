import 'package:dio/dio.dart';

final dioProvider = Dio(
  BaseOptions(
    baseUrl: 'https://fake-api.local',
    connectTimeout: const Duration(seconds: 3),
  ),
);
