import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/controller/services/get_weather_service.dart';
import 'package:my_weather_app/views/screen/search_screen.dart';
import 'package:sizer/sizer.dart';
import 'controller/cubit/weather_cubit.dart';
import 'views/screen/home_screen.dart';
import 'views/settings/app_routes.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => WeatherCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch:
                BlocProvider.of<WeatherCubit>(context).weatherModal == null
                    ? Colors.blue
                    : BlocProvider.of<WeatherCubit>(context)
                        .weatherModal
                        !.getThemeColor()),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.homePage: (context) => HomeScreen(),
          AppRoutes.searchPage: (context) => SearchScreen(),
        },
        initialRoute: AppRoutes.homePage,
    );
  }
}
