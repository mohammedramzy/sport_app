part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

///////////////////////////////////////////////////////
class ChangeBottomNavBarState extends MainState {}

///////////////////////////////////////////////////////
class ChangeAppLanguageState extends MainState {}

class AddImageLoadingState extends MainState {}

class AddImageSuccessState extends MainState {}

class AddImageErrorState extends MainState {}

class GetNewsLoadingState extends MainState {}

class GetNewsSuccessState extends MainState {}
