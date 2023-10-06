import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/change_theme_cubit/change_theme_cubit.dart';
import 'package:weather_app/cubit/get_weather_cubit/weather_cubit.dart';
import 'package:weather_app/widgets/body_home_page.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Weather APP'),
                actions: [
                  IconButton(
                      onPressed: () {
                        ChangeThemeCubit.get(context).changeMode();
                      },
                      icon: ChangeThemeCubit
                          .get(context)
                          .isLight == true
                          ? const Icon(
                        Icons.light_mode,
                        color: Colors.yellow,
                      )
                          : const Icon(Icons.dark_mode))
                ],
              ),
              body:const BodyHomePage(),
            

          );
        },
      ),

    );
  }
}


