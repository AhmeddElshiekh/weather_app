import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/change_theme_cubit/change_theme_cubit.dart';
import 'package:weather_app/cubit/get_weather_cubit/weather_cubit.dart';
import 'package:weather_app/widgets/body_home_page.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:weather_app/widgets/network_connectivity.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map _source = {ConnectivityResult.none: false};
  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;
  String string = '';

  @override
  void initState() {
    super.initState();
    _networkConnectivity.initialise();
    _networkConnectivity.myStream.listen((source) {
      _source = source;
      if (kDebugMode) {
        print('source $_source');
      }
      // 1.
      switch (_source.keys.toList()[0]) {
        case ConnectivityResult.mobile:
          string =
          _source.values.toList()[0] ? 'You are connected to the Internet, you can search now' : 'Mobile: Offline';
          break;
        case ConnectivityResult.wifi:
          string =
          _source.values.toList()[0] ? 'You are connected to the Internet, you can search now' : 'WiFi: Offline';
          break;
        case ConnectivityResult.none:
        default:
          string = 'You are not connected to the Internet, please check your network';
      }
      setState(() {});

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor:string == 'You are connected to the Internet, you can search now' ? Colors.green : Colors.red ,
          content: Text(
            string,
            style:  const TextStyle(fontSize: 20, ),
          ),
        ),
      );
    });
  }

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
              body:const BodyHomePage()

          );
        },
      ),

    );
  }


  @override
  void dispose() {
    _networkConnectivity.disposeStream();
    super.dispose();
  }
}


