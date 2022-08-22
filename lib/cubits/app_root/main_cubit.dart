import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/modules/home_screen.dart';
import 'package:sport_app/modules/more_screen.dart';
import 'package:sport_app/modules/news_screen.dart';
import 'package:sport_app/modules/league_table_screen.dart';
import 'package:sport_app/modules/statistics_screen.dart';

import '../../core/local/cache_helper.dart';
import '../../core/local/cache_keys.dart';
import '../../layout/app_root.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  int currentIndex = 0;

  MainCubit() : super(MainInitial());
  static MainCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    const HomeScreen(),
    const LeagueTableScreen(),
    const NewsScreen(),
    const StatisticsScreen(),
    const MoreScreen()
  ];
  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

  String language = CacheKeysManger.getLanguageFromCache();
  void changeAppLanguage(BuildContext context, {required String lang}) {
    CacheHelper.saveData(key: 'lang', value: lang).then((value) {
      language = lang;
      emit(ChangeAppLanguageState());
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (bu) => const AppRoot()),
          (route) => false);
    });
  }
}
