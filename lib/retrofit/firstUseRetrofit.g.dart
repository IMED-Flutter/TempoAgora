// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firstUseRetrofit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    wx_desc: json['wx_desc'] as String,
    temp_c: (json['temp_c'] as num)?.toDouble(),
    feelslike_c: (json['feelslike_c'] as num)?.toDouble(),
    humid_pct: (json['humid_pct'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'wx_desc': instance.wx_desc,
      'temp_c': instance.temp_c,
      'feelslike_c': instance.feelslike_c,
      'humid_pct': instance.humid_pct,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'http://api.weatherunlocked.com/api/current';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getTasks(latLng, app_id, app_key) async {
    ArgumentError.checkNotNull(latLng, 'latLng');
    ArgumentError.checkNotNull(app_id, 'app_id');
    ArgumentError.checkNotNull(app_key, 'app_key');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'app_id': app_id,
      r'app_key': app_key
    };
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/$latLng',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Weather.fromJson(_result.data);
    return value;
  }
}
