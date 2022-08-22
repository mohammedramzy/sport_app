import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sport_app/core/style/app_theme.dart';
import 'package:sport_app/layout/main_screen.dart';

import '../cubits/app_root/main_cubit.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => MainCubit()),
      ],
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.get(context);
          return ScreenUtilInit(
            designSize: const Size(360, 640),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, wid) => MaterialApp(
              debugShowCheckedModeBanner: false,
              builder: (context, widget) {
                ScreenUtil.init(context);
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget!,
                );
              },
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''),
                Locale('ar', ''),
              ],
              locale: Locale.fromSubtags(languageCode: cubit.language),
              theme: appTheme,
              themeMode: ThemeMode.light,
              home: const MainScreen(),
            ),
          );
        },
      ),
    );
  }
}
