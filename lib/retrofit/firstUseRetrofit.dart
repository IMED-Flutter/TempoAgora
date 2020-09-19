import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'firstUseRetrofit.g.dart';

@RestApi(baseUrl: "http://api.weatherunlocked.com/api/current")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/{latLng}")
  Future<Weather> getTasks(
      @Path("latLng") String latLng,
      @Query("app_id") String app_id,
      @Query("app_key") String app_key);

  /*
  "app_id": "2e2e739a", "app_key": "6101cec4ad2978185a10d906ae03a9da"}
   */
}

@JsonSerializable()
class Weather {
  String wx_desc;
  double temp_c;
  double feelslike_c;
  double humid_pct;

  Weather({this.wx_desc, this.temp_c, this.feelslike_c, this.humid_pct});

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}