import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/check_internet/check_internet_cubit.dart';
import 'package:weather_app/cubit/get_weather_cubit/weather_cubit.dart';

class WeatherLoadedError extends StatelessWidget {
  const WeatherLoadedError({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckInternetCubit, CheckInternetState>(
      listener: (context, states) {
        if (states is NotConnectedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(states.message),

          ));
        }
        if (states is ConnectedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text(states.message),
          ));
        }
      },
      builder: (context, states) {
        return BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            return Column(
              children: [
                if (state is WeatherLoadedErrorState || states is NotConnectedState)
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.error,
                          size: 35,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: Text(
                          'Please enter the right name for your country or city or Check your internet ',
                          style: TextStyle(fontSize: 20),
                        )),
                      ],
                    ),
                  ),

              ],
            );
          },
        );
      },
    );
  }
}
