import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/cubits/app_root/main_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowVideosScreen extends StatefulWidget {
  const ShowVideosScreen({Key? key}) : super(key: key);

  @override
  State<ShowVideosScreen> createState() => _ShowVideosScreenState();
}

class _ShowVideosScreenState extends State<ShowVideosScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          var mainCubit = MainCubit.get(context);

          return Scaffold(
            body: ListView.builder(
              itemBuilder: (_, index) => Container(
                margin: const EdgeInsets.all(5),
                child: GestureDetector(
                    onTap: () {
                      _launchUrl("https://www.youtube.com/watch?v=5hqrO-B703Q");
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.network(mainCubit.videos[index].image!),
                        const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 100,
                        )
                      ],
                    )),
              ),
              itemCount: mainCubit.videos.length,
            ),
          );
        });
  }

  Future<void> _launchUrl(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw 'Could not launch $_url';
    }
  }
}
