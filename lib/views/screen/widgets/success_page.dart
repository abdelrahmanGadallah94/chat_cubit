import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/cubit/weather_cubit.dart';
import '../../../modal/weather_modal.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  final WeatherModal? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            weatherData!.getThemeColor(),
            weatherData!.getThemeColor()[500]!,
            weatherData!.getThemeColor()[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
          Text(
            BlocProvider.of<WeatherCubit>(context).cityName ?? '',
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
          ),
          Text(
            "Updated at: ${BlocProvider.of<WeatherCubit>(context).weatherData!.date.hour} : ${BlocProvider.of<WeatherCubit>(context).weatherData!.date.minute}",
            style: TextStyle(
              fontSize: 18.sp,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                "http:${BlocProvider.of<WeatherCubit>(context).weatherData!.icon}",
                height: 100,
              ),
              Text(
                BlocProvider.of<WeatherCubit>(context).weatherData!.temp.toInt().toString(),
                style: TextStyle(
                    fontSize: 35.sp, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Text(
                    "minTemp:${BlocProvider.of<WeatherCubit>(context).weatherData!.minTemp.toInt()}",
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                  Text(
                    "maxTemp:${BlocProvider.of<WeatherCubit>(context).weatherData!.maxTemp.toInt()}",
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Text(
            BlocProvider.of<WeatherCubit>(context).weatherData?.weatherState ?? '',
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
          ),
          const Spacer(flex: 5),
        ],
      ),
    );
  }
}

