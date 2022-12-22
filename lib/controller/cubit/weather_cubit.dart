import 'package:bloc/bloc.dart';
import 'package:my_weather_app/controller/cubit/weather_state.dart';

import '../../modal/weather_modal.dart';
import '../services/get_weather_service.dart';

class WeatherCubit extends Cubit<WeatherState>{
  WeatherCubit() : super(WeatherState());

  WeatherModal ? weatherModal;
  String? cityName;
 void weatherCubit({required String cityName}) async{

    emit(LoadingState());

    try{
      weatherModal = await WeatherServices().getWeather(country: cityName);
      emit(SuccessState());

    }on Exception catch(e){

    emit(FailureState());
    }

  }

}