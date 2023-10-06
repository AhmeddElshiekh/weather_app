import 'package:flutter/material.dart';
import 'package:weather_app/cubit/get_weather_cubit/weather_cubit.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(15),
      child: TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsetsDirectional.all(25),
          suffixIcon: Icon(Icons.search),
          labelText: 'Country',
          hintText: 'Enter a city',
        ),
        onChanged: (value) {
          WeatherCubit.get(context).getWeatherApi(value: value);
        },
      ),
    );
  }
}
