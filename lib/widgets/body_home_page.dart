import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/check_internet/check_internet_cubit.dart';
import 'package:weather_app/cubit/get_weather_cubit/weather_cubit.dart';
import 'package:weather_app/widgets/weather_founded.dart';
import 'package:weather_app/widgets/weather_loaded_error.dart';

import 'custom_text_form_filed.dart';
import 'no_weather.dart';

class BodyHomePage extends StatelessWidget {
  const BodyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckInternetCubit, CheckInternetState>(
      listener: (context, state) {
        if(state is ConnectedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
             backgroundColor: Colors.green,
            content: Text(state.message),
          ));

        }
        if(state is NotConnectedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(state.message),
          ));        }
      },
      builder: (context, state) {
        return BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomTextFormFiled(),
                    if (state is WeatherLoadingState)
                      const CircularProgressIndicator(),
                    if (state is WeatherInitial ) const NoWeather(),
                    if(state is WeatherLoadedErrorState)
                      const WeatherLoadedError(),
                    if (state is WeatherLoadedSuccessState )
                      const WeatherFounded(),

                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
