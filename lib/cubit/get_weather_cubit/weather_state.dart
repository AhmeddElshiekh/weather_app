part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}
class WeatherLoadingState extends WeatherState {}
class WeatherLoadedSuccessState extends WeatherState {}
class WeatherLoadedErrorState extends WeatherState {}




