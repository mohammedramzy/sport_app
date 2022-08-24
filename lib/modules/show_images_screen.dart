import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/cubits/app_root/main_cubit.dart';

class ShowImagesScreen extends StatefulWidget {
  const ShowImagesScreen({Key? key}) : super(key: key);

  @override
  State<ShowImagesScreen> createState() => _ShowImagesScreenState();
}

class _ShowImagesScreenState extends State<ShowImagesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          var mainCubit = MainCubit.get(context);

          return Scaffold(
            body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 1.5),
              itemBuilder: (_, index) => Container(
                margin: const EdgeInsets.all(5),
                child: Image.network(mainCubit.images[index].image!),
              ),
              itemCount: mainCubit.images.length,
            ),
          );
        });
  }
}
