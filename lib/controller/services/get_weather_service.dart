import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_weather_app/views/settings/app_strings.dart';

import '../../modal/weather_modal.dart';

class WeatherServices {
  Future<WeatherModal?> getWeather({required String country}) async {


    http.Response response = await http.get(Uri.parse(
        "${AppString.baseUrl}/forecast.json?key=${AppString.apiKey}&q=$country&days=7"));

    if(response.statusCode == 200){
      Map<String, dynamic> data =  jsonDecode(response.body);

      print(data);
      WeatherModal weatherData =  WeatherModal.fromJson(data);
      print(weatherData.temp.toString());
      return weatherData;
    }else{
      throw Exception("A problem with url ${response.statusCode}");
    }
  }
}
