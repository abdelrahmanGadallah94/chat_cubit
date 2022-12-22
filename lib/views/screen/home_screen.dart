import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/controller/cubit/weather_cubit.dart';
import 'package:my_weather_app/modal/weather_modal.dart';
import 'package:my_weather_app/views/screen/search_screen.dart';
import 'package:my_weather_app/views/screen/widgets/initial_page.dart';
import '../../controller/cubit/weather_state.dart';
import '../settings/app_strings.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  WeatherModal? weatherData;

  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.weatherApp),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SearchScreen();
                  },
                ));
              },
              icon: const Icon(
                Icons.search,
                size: 25,
              )),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SuccessState) {
            weatherData = BlocProvider
                .of<WeatherCubit>(context)
                .weatherModal;
            return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        weatherData!.getThemeColor(),
                        weatherData!.getThemeColor()[400]!,
                        weatherData!.getThemeColor()[100]!,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 4,),
                  Text(BlocProvider
                      .of<WeatherCubit>(context)
                      .cityName
                      .toString(), style: const TextStyle(fontSize: 35),),
                  const Spacer(),
                  Text(
                    "Updated at: ${weatherData?.date.hour} : ${weatherData?.date
                        .minute}", style: const TextStyle(fontSize: 16),),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.network("http:${weatherData!.icon}"),
                      Text(weatherData?.temp.toInt().toString() ?? '',
                        style: const TextStyle(fontSize: 18),),
                      Column(
                        children: [
                          Text("minTemp: ${weatherData?.minTemp.toInt()}",
                              style: const TextStyle(fontSize: 14)),
                          Text("maxTemp: ${weatherData?.minTemp.toInt()}",
                              style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(weatherData?.weatherState.toString() ?? '',
                    style: const TextStyle(fontSize: 35),),
                  const Spacer(flex: 6,)
                ],
              ),
            );
          } else if (state is FailureState) {
            return Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 30),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.red,
                          Colors.white,
                          Colors.black
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                    )
                ),
                child: const Text("Error data.. please try again",
                  style: TextStyle(fontSize: 18),),
              ),
            );
          }
          else {
            return const InitialPage();
          }
        },
      ),

    );
  }
  }
