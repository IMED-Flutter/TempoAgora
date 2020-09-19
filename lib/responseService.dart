class ResponseService {

  String wx_desc;
  double temp_c;
  double feelslike_c;
  double humid_pct;

  //construtor
  ResponseService({
    this.wx_desc,
    this.temp_c,
    this.feelslike_c,
    this.humid_pct
  });

  //construtor nomeado
  ResponseService.fromJson(Map<String, dynamic> json)
      : wx_desc = json['wx_desc'],
        temp_c = json['temp_c'],
        feelslike_c = json['feelslike_c'],
        humid_pct = json['humid_pct'];


}
