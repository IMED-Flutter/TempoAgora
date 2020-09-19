import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app_consulta_tempo/responseService.dart';

Future<ResponseService> getPositions() async{
  Response resCurrency = await Dio().get(
      "https://api.currencyfreaks.com/latest",
      queryParameters: {"apikey": "7e63a4dd31d8411a8209888ee203b985", "symbols": "PKR,GBP,EUR,USD"});


  print(resCurrency.data);

  return ResponseService();
}
