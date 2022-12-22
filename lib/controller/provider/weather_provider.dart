import 'package:flutter/material.dart';
import 'package:my_weather_app/modal/weather_modal.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModal? _weatherData;

  String ?cityName;

  set weatherData(WeatherModal? weather){
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModal? get weatherData => _weatherData;

}