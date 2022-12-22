import 'package:flutter/material.dart';
import 'package:my_weather_app/controller/cubit/weather_cubit.dart';
import '../../modal/weather_modal.dart';
import '../settings/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  WeatherModal ? weatherModal;

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(AppString.weatherApp),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: TextField(
            controller: controller,
            onSubmitted: (data) async {

            },
            onChanged: (data){

            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              contentPadding:
              const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
              hintText: AppString.country,
              suffixIcon: IconButton(
                  onPressed: () async {
                    BlocProvider.of<WeatherCubit>(context).weatherCubit(cityName: controller.text);
                    BlocProvider.of<WeatherCubit>(context).cityName = controller.text;
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.search)),
              labelText: AppString.search,
            ),
          ),
        ),
      ),
    );
  }
}

