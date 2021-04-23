import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bb/screens/comic_detail_screen/comic_detail_screen.dart';
import 'package:project_bb/screens/comic_list_screen/cubit/comic_list_cubit.dart';
import 'package:project_bb/widgets/comic_list.dart';
import 'package:project_bb/widgets/loading_widget.dart';

class ComicListScreen extends StatefulWidget {
  @override
  _ComicListScreenState createState() => _ComicListScreenState();
}

class _ComicListScreenState extends State<ComicListScreen> {
  /// TODO: Add image opener
  /// TODO: Add error handlings
  /// TODO: What happens if WIFI/Cellular is not available
  /// TODO: What happens if server is 404
  /// TODO: What happens if couple of items is not exist
  /// TODO: Add refresh whole list option (scroll to refresh)
  /// TODO: Catch latest list element 0 on comics
  /// TODO: Use freezed for helping to state management
  /// TODO: Clean up emitting states
  /// TODO: Fix load double more problem
  ComicListCubit cubit = ComicListCubit();

  void initState() {
    super.initState();
    cubit.init();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => cubit,
        child: _BuildBodyWidget(),
      ),
    );
  }
}

class _BuildBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComicListCubit, ComicListState>(
      buildWhen: (previous, current) =>
          previous.pageIsLoading != current.pageIsLoading ||
          previous.moreLoading != current.moreLoading ||
          previous.comicList != current.comicList ||
          previous.loadedDataCount != current.loadedDataCount,
      builder: (context, state) {
        if (state.pageIsLoading)
          return LoadingWidget(
              count: state.loadedDataCount, totalCount: state.totalDataCount);
        return SafeArea(
            child: ComicList(
          onRefresh: () async => await context.read<ComicListCubit>().init(),
          comicList: state.comicList,
          onMaxScroll: () async {
            if (!state.moreLoading)
              await context.read<ComicListCubit>().loadMore();
          },
          onTap: (comic) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ComicDetailScreen(comic: comic)),
            );
          },
          moreLoading: state.moreLoading,
          loadMoreWidget: LoadingWidget(
              count: state.loadedDataCount, totalCount: state.totalDataCount),
        ));
      },
    );
  }
}
