import 'package:flutter/material.dart';

class WeatherModal {
  final DateTime date;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String weatherState;
  final String icon;

// 1- using parameterized constructor
  WeatherModal(
      {required this.date,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherState,
      required this.icon});

// 2- using named constructor

  // WeatherModal.fromJson(dynamic jsonData) {
  //   var data = jsonData["forecast"]["forecastday"][0];
  //   date = jsonData["location"]["localtime"];
  //   temp = data["day"]["avgtemp_c"];
  //   minTemp = data["day"]["mintemp_c"];
  //   maxTemp = data["day"]["maxtemp_c"];
  //   weatherState = data["hour"][0]["condition"]["text"];
  //   icon = jsonData["current"]["condition"]["icon"];
  // }

//3- using factory constructor
  factory WeatherModal.fromJson(dynamic jsonData) {
    var data = jsonData["forecast"]["forecastday"][0];
    return WeatherModal(
      date: DateTime.parse(jsonData["current"]["last_updated"]),
      temp: data["day"]["avgtemp_c"],
      minTemp: data["day"]["mintemp_c"],
      maxTemp: data["day"]["maxtemp_c"],
      weatherState: data["hour"][0]["condition"]["text"],
      icon: data["hour"][0]["condition"]["icon"],
    );
  }

  MaterialColor getThemeColor(){

    if(weatherState == "Light rain"){
      return Colors.cyan;
    }else if(weatherState == "Partly cloudy" || weatherState == "Cloudy"){
      return Colors.lime;
    } else if(weatherState == "Overcast" || weatherState == "Light drizzle"){
      return Colors.pink;
    } else if(weatherState == "Light rain" || weatherState == "Moderate rain"){
      return Colors.indigo;
    }else if(weatherState == "Clear"){
      return Colors.orange;
    }
    else{
      return Colors.blue;
    }
  }
}
