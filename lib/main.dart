import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cache_helper.dart';
import 'package:weather_app/cubit/bloc_observer.dart';
import 'package:weather_app/cubit/change_theme_cubit/change_theme_cubit.dart';
import 'package:weather_app/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  dynamic isLight = CacheHelper.getSaveData(key: 'mode');
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(
    isLight: isLight,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.isLight}) : super(key: key);
  final dynamic isLight;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeThemeCubit()..changeMode(fromShared: isLight),
      child:BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
  builder: (context, state) {
    return MaterialApp(
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: ChangeThemeCubit.get(context).isLight == true
            ? ThemeMode.light
            : ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      );
  },
),
    );
  }
}
