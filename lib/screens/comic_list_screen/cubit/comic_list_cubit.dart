import 'package:bloc/bloc.dart';
import 'package:project_bb/models/comic.dart';
import 'package:project_bb/repository/comic_repository.dart';
import 'package:project_bb/screens/comic_list_screen/cubit/comic_list_state.dart';
import 'package:project_bb/services/api_response_status.dart';

class ComicListCubit extends Cubit<ComicListState> {
  ComicListCubit({this.comicRepository}) : super(const InitialState());

  final ComicRepository comicRepository;

  /// ShowLoading
  int _latestComicNumber;
  int _loadedDataCount = 0;
  int _totalDataCount = 15;

  /// ShowView
  bool _moreLoading = false;
  List<Comic> _comicList = List<Comic>();
  int _reloadComicIndex;

  Future<void> initialize() async {
    if (!(state is ShowLoading)) {
      _buildLoad(showPercentage: false);
      try {
        _comicList.clear();
        Comic latestComic = await comicRepository.getLatestComic();
        _latestComicNumber = latestComic.number;
        _comicList = await comicRepository.getListOfComics(
          latestComicNumber: _latestComicNumber,
          index: _totalDataCount,
          onIndexChanged: (v) {
            _loadedDataCount = v;
            _buildLoad();
          },
        );
        _latestComicNumber = _latestComicNumber - _totalDataCount;
        _buildView();
      } on ApiResponseStatus catch (e) {
        _buildError(e);
      }
    }
  }

  Future<void> loadMore() async {
    if (!_moreLoading) {
      _buildLoadMore();
      List<Comic> _tempList = await comicRepository.getListOfComics(
        latestComicNumber: _latestComicNumber,
        index: _totalDataCount,
        onIndexChanged: (v) {
          _loadedDataCount = v;
          _buildView();
        },
      );
      _comicList.addAll(_tempList);
      _latestComicNumber = _latestComicNumber - _totalDataCount;
      _loadedDataCount = 0;
      _buildLoadMore();
    }
  }

  Future<void> reLoadComic(int comicNumber, int index) async {
    _reloadComicIndex = index;
    _buildView();
    Comic _comic = await comicRepository.getComic(comicNumber);
    _comicList.setAll(index, [_comic]);
    _reloadComicIndex = null;
    _buildView();
  }

  void _buildLoadMore() {
    _moreLoading = !_moreLoading;
    _buildView();
  }

  void _buildLoad({bool showPercentage = true}) {
    if (showPercentage)
      emit(ShowLoading(
          totalDataCount: _totalDataCount, loadedDataCount: _loadedDataCount));
    else
      emit(ShowLoading());
  }

  void _buildView() {
    emit(
      ShowView(
        comicList: _comicList,
        moreLoading: _moreLoading,
        loadedDataCount: _loadedDataCount,
        totalDataCount: _totalDataCount,
        reloadComicIndex: _reloadComicIndex,
      ),
    );
  }

  void _buildError(ApiResponseStatus apiResponseStatus) =>
      emit(ShowError(error: handleBaseResponseWithString(apiResponseStatus)));
}
