
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService{

  final Dio dio;

  WeatherService(this.dio);
  
  Future <WeatherModel> getWeather({required String cityName})async {
    try {
      Response response = await dio.get('http://api.weatherapi.com/v1/forecast.json?key=40facb2938c543288f9143756231107&q=$cityName');
      WeatherModel weatherModel =WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {

      String eerMassage = e.response?.data['error']['message'] ?? 'Oops there is an error , please try again';
      throw(eerMassage);
    }catch(e){
      throw('Oops there is an error , please try again');
    }

    
  }

}