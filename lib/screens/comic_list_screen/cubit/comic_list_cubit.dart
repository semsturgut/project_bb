import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_bb/models/comic.dart';
import 'package:project_bb/repository/comic_repository.dart';

part 'comic_list_state.dart';

class ComicListCubit extends Cubit<ComicListState> {
  ComicListCubit()
      : super(ComicListState(
          moreLoading: false,
          totalDataCount: 15,
          loadedDataCount: 0,
        ));

  List<Comic> _comicList = List<Comic>();

  Future<void> init() async {
    emit(state.copyWith(pageIsLoading: true));
    _comicList.clear();
    Comic latestComic = await ComicRepository.getLatestComic();
    _comicList = await ComicRepository.getListOfComics(
      latestComicNumber: latestComic.number,
      index: state.totalDataCount,
      onIndexChanged: (v) => emit(state.copyWith(loadedDataCount: v)),
    );
    emit(state.copyWith(
      comicList: _comicList,
      latestComicNumber: latestComic.number - state.totalDataCount,
      loadedDataCount: 0,
      pageIsLoading: false,
    ));
  }

  Future<void> loadMore() async {
    print(state.moreLoading);
    emit(state.copyWith(moreLoading: true));
    _comicList = state.comicList;
    _comicList.addAll(await ComicRepository.getListOfComics(
      latestComicNumber: state.latestComicNumber,
      index: state.totalDataCount,
      onIndexChanged: (v) => emit(state.copyWith(loadedDataCount: v)),
    ));
    emit(state.copyWith(
      comicList: _comicList,
      latestComicNumber: state.latestComicNumber - state.totalDataCount,
      loadedDataCount: 0,
      moreLoading: false,
    ));
  }
}
