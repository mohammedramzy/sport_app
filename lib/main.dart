import 'package:flutter/material.dart';
import 'package:sport_app/layout/app_root.dart';

import 'core/local/cache_helper.dart';
import 'core/network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  runApp(const AppRoot());
}
