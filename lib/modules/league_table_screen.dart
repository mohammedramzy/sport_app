import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/components/custom_app_bar_in_body.dart';
import '../core/components/user_item.dart';
import '../cubits/app_root/main_cubit.dart';

class LeagueTableScreen extends StatelessWidget {
  const LeagueTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          var mainCubit = MainCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomAppBarInBody(),
                  for (var e in mainCubit.userResponse.data!) ...{
                    UserItem(user: e),
                    const Divider()
                  }
                ],
              ),
            ),
          );
        });
  }
}
