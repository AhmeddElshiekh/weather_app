import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/cache_helper.dart';

part 'change_theme_state.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeInitial());
  static ChangeThemeCubit get(context ) => BlocProvider.of(context);

  bool isLight = true;

  void changeMode({bool? fromShared}) {
    if (fromShared != null) {
      isLight = fromShared;

      emit(WeatherChangeModeState());
    } else {
      isLight = !isLight;
      CacheHelper.saveData(key: 'mode', value: isLight).then((value) {
        emit(WeatherChangeModeState());
      });
    }
  }
}
