import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sport_app/core/network/dio_helper.dart';
import 'package:sport_app/core/network/end_points.dart';
import 'package:sport_app/models/image_response.dart';
import 'package:sport_app/models/news_response.dart';
import 'package:sport_app/models/user_response.dart';
import 'package:sport_app/models/video_response.dart';
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

  UserResponse userResponse = UserResponse();
  void getUsers() async {
    await DioHelper.getData(url: GET_USERS).then((value) {
      userResponse = UserResponse.fromJson(value.data);
    });
  }

  int pageEvent = 1;
  List<NewsResponse> newsResponse = [];
  Future<List<NewsResponse>> getNews(int pageKey) async {
    emit(GetNewsLoadingState());
    await DioHelper.getData(url: GET_NEWS, query: {"page": pageKey, "limit": 7})
        .then((value) {
      for (var element in value.data) {
        newsResponse.add(NewsResponse.fromJson(element));
      }
      emit(GetNewsSuccessState());
    });
    return newsResponse;
  }

  List<ImageResponse> images = [];
  void getImages() async {
    await DioHelper.getData(url: GET_IMAGES).then((value) {
      for (var element in value.data) {
        images.add(ImageResponse.fromJson(element));
      }
    });
  }

  List<VideoResponse> videos = [];
  void getVideos() async {
    await DioHelper.getData(url: GET_VIDEOS).then((value) {
      for (var element in value.data) {
        videos.add(VideoResponse.fromJson(element));
      }
    });
  }

  var picker = ImagePicker();
  File? imagePicked;

  void pickImage({
    required ImageSource source,
  }) {
    emit(AddImageLoadingState());
    picker
        .pickImage(
      source: source,
      imageQuality: 10,
    )
        .then((value) {
      if (value != null) {
        imagePicked = File(value.path);

        emit(AddImageSuccessState());
      } else {
        debugPrint('No image selected !!!');
        emit(AddImageErrorState());
      }
    });
  }
}
