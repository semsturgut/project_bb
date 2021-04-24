import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_bb/models/comic.dart';

part 'comic_list_state.freezed.dart';

@freezed
abstract class ComicListState with _$ComicListState {
  const factory ComicListState.initial() = InitialState;

  const factory ComicListState.showLoading({
    int loadedDataCount,
    int totalDataCount,
  }) = ShowLoading;

  const factory ComicListState.showError({String error}) = ShowError;

  const factory ComicListState.showView({
    /// Load More
    bool moreLoading,
    int loadedDataCount,
    int totalDataCount,

    /// Data
    List<Comic> comicList,
    int reloadComicIndex,
  }) = ShowView;
}
