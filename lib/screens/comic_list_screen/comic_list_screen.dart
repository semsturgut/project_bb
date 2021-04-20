import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bb/screens/comic_list_screen/cubit/comic_list_cubit.dart';
import 'package:project_bb/widgets/comic_list.dart';
import 'package:project_bb/widgets/loading_widget.dart';

class ComicListScreen extends StatefulWidget {
  @override
  _ComicListScreenState createState() => _ComicListScreenState();
}

class _ComicListScreenState extends State<ComicListScreen> {
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
          previous.isLoading != current.isLoading ||
          previous.loadMore != current.loadMore ||
          previous.comicList != current.comicList ||
          previous.loadedDataCount != current.loadedDataCount,
      builder: (context, state) {
        if (state.isLoading)
          return LoadingWidget(
              count: state.loadedDataCount, totalCount: state.totalDataCount);
        return SafeArea(
            child: ComicList(
          comicList: state.comicList,
          onMaxScroll: () async {
            if (!state.loadMore)
              await context.read<ComicListCubit>().loadMore();
          },
          onTap: (comic) {},
          loadMoreWidget: LoadingWidget(
              count: state.loadedDataCount, totalCount: state.totalDataCount),
        ));
      },
    );
  }
}
