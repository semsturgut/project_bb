import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bb/repository/comic_repository.dart';
import 'package:project_bb/screens/comic_detail_screen/comic_detail_screen.dart';
import 'package:project_bb/screens/comic_list_screen/cubit/comic_list_cubit.dart';
import 'package:project_bb/screens/comic_list_screen/cubit/comic_list_state.dart';
import 'package:project_bb/services/api_response_status.dart';

import 'package:project_bb/widgets/comic_list.dart';
import 'package:project_bb/widgets/loading_widget.dart';

const Duration changeStateDuration = Duration(milliseconds: 200);

class ComicListScreen extends StatefulWidget {
  @override
  _ComicListScreenState createState() => _ComicListScreenState();
}

class _ComicListScreenState extends State<ComicListScreen> {
  ComicListCubit cubit = ComicListCubit(comicRepository: ComicRepository());

  void initState() {
    super.initState();
    cubit.initialize();
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
    return Scaffold(
      body: BlocBuilder<ComicListCubit, ComicListState>(
        builder: _builder,
      ),
    );
  }
}

Widget _builder(BuildContext context, ComicListState state) => AnimatedSwitcher(
      duration: changeStateDuration,
      child: state.maybeMap(
        showLoading: (loadingState) => LoadingWidget(
          count: loadingState.loadedDataCount,
          totalCount: loadingState.totalDataCount,
        ),
        showError: (errorState) => _buildError(context, errorState),
        showView: (viewState) => _buildList(context, viewState),
        orElse: () => const Center(child: Text("Unknown problem occured!")),
      ),
    );

Widget _buildList(BuildContext context, ShowView state) {
  return SafeArea(
    child: ComicList(
      onRefresh: context.read<ComicListCubit>().initialize,
      comicList: state.comicList,
      onMaxScroll: context.read<ComicListCubit>().loadMore,
      onTap: (comic, index) {
        if (comic.responseStatus == ApiResponseStatus.successful)
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ComicDetailScreen(comic: comic)));
        else
          context.read<ComicListCubit>().reLoadComic(comic.number, index);
      },
      moreLoading: state.moreLoading,
      reLoadingIndex: state.reloadComicIndex,
      loadMoreWidget: LoadingWidget(
          count: state.loadedDataCount, totalCount: state.totalDataCount),
    ),
  );
}

Widget _buildError(BuildContext context, ShowError state) {
  return Center(
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(state.error),
      CupertinoButton(
        onPressed: context.read<ComicListCubit>().initialize,
        child: Text("Reload"),
      ),
    ]),
  );
}
