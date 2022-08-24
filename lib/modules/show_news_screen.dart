import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/models/news_response.dart';

import '../core/components/build_news_item.dart';
import '../core/network/end_points.dart';
import '../cubits/app_root/main_cubit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ShowNewsScreen extends StatefulWidget {
  const ShowNewsScreen({Key? key}) : super(key: key);

  @override
  State<ShowNewsScreen> createState() => _ShowNewsScreenState();
}

class _ShowNewsScreenState extends State<ShowNewsScreen> {
  final int _pageSize = ITEM_COUNT;

  final PagingController<int, NewsResponse> _pagingController =
      PagingController(firstPageKey: 0);

  Future<void> _fetchPage(pageKey) async {
    try {
      final newItems = await MainCubit.get(context).getNews(pageKey + 1);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void initState() {
    super.initState();
    MainCubit.get(context).pageEvent = 1;
    MainCubit.get(context).newsResponse = [];
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          child: RefreshIndicator(
            onRefresh: () => Future.sync(() => _pagingController.refresh()),
            child: PagedListView<int, NewsResponse>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<NewsResponse>(
                itemBuilder: (context, item, index) => Padding(
                  padding: const EdgeInsets.all(5),
                  child: NewsItem(item: item),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
