import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app_consulta_tempo/responseService.dart';

Future<ResponseService> getInfoWeather(double latitude, double longitude) async{
  Response resCurrency = await Dio().get(
      "http://api.weatherunlocked.com/api/current/${latitude},${longitude}",
      queryParameters: {"app_id": "2e2e739a", "app_key": "6101cec4ad2978185a10d906ae03a9da"});

  return ResponseService.fromJson(resCurrency.data);
}
