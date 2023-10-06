import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/weather_cubit.dart';

class WeatherFounded extends StatelessWidget {
  const WeatherFounded({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherModel = WeatherCubit.get(context).weatherModel;
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                weatherModel.status!,
                style: const TextStyle(fontSize: 20),
              ),
              if (weatherModel.avgTemp! >= 0 && weatherModel.avgTemp! < 10)
                Image.asset('assets/images/snow.png', fit: BoxFit.cover),
              if (weatherModel.avgTemp! >= 10 && weatherModel.avgTemp! < 15)
                Image.asset('assets/images/rainy.png', fit: BoxFit.cover),
              if (weatherModel.avgTemp! >= 15 && weatherModel.avgTemp! < 20)
                Image.asset('assets/images/cloudy.png', fit: BoxFit.cover),
              if (weatherModel.avgTemp! >= 20 && weatherModel.avgTemp! < 30)
                Image.asset('assets/images/clear.png', fit: BoxFit.cover),
              if (weatherModel.avgTemp! < 0)
                Image.asset('assets/images/thunderstorm.png',
                    fit: BoxFit.cover),
              Text(
                '${weatherModel.country}',
                maxLines: 1,
                style: const TextStyle(
                    fontSize: 20, overflow: TextOverflow.ellipsis),
              ),
              Text(
                weatherModel.cityName!,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 20,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${weatherModel.avgTemp!.round()}°C',
                    style: const TextStyle(fontSize: 40),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        'Max Temp: \n${weatherModel.maxTemp!.round()}°C',
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Min Temp: \n${weatherModel.minTemp!.round()}°C',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
