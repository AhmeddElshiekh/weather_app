import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  static WeatherCubit get(context) => BlocProvider.of(context);



  late WeatherModel weatherModel;
  getWeatherApi({required String value})async{
    emit(WeatherLoadingState());
        try {
          weatherModel = await WeatherService(Dio()).getWeather(cityName: value);
          emit(WeatherLoadedSuccessState());
        } catch (e) {
          log(e.toString());
          emit(WeatherLoadedErrorState());
        }

  }



}
