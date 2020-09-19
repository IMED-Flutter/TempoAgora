import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app_consulta_tempo/responseService.dart';

Future<ResponseService> getInfoWeather(double latitude, double longitude) async{
  Response resCurrency = await Dio().get(
      "http://api.weatherunlocked.com/api/current/${latitude},${longitude}",
      queryParameters: {"app_id": "2e2e739a", "app_key": "6101cec4ad2978185a10d906ae03a9da"});

  return ResponseService.fromJson(resCurrency.data);
}

/*

RETORNO DO SERVIÇO:
{
    "lat": -29.72,
    "lon": -53.7,
    "alt_m": 85,
    "alt_ft": 278.87,
    "wx_desc": "Partly cloudy",
    "wx_code": 1,
    "wx_icon": "PartlyCloudyNight.gif",
    "temp_c": 20,
    "temp_f": 68,
    "feelslike_c": 21.26,
    "feelslike_f": 70.27,
    "humid_pct": 73,
    "windspd_mph": 2.49,
    "windspd_kmh": 4,
    "windspd_kts": 2.16,
    "windspd_ms": 1.11,
    "winddir_deg": 10,
    "winddir_compass": "N",
    "cloudtotal_pct": 50,
    "vis_km": 10,
    "vis_mi": 6.21,
    "vis_desc": null,
    "slp_mb": 1010.8,
    "slp_in": 29.93,
    "dewpoint_c": 15.02,
    "dewpoint_f": 59.04
}
 */
