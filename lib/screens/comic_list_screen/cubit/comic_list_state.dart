part of 'comic_list_cubit.dart';

class ComicListState extends Equatable {
  /// Common
  final bool isLoading;
  final int latestComicNumber;

  /// Data
  final List<Comic> comicList;
  final bool loadMore;
  final int loadedDataCount;
  final int totalDataCount;

  const ComicListState({
    /// Common
    this.isLoading,
    this.latestComicNumber,

    /// Data
    this.comicList,
    this.loadMore,
    this.loadedDataCount,
    this.totalDataCount,
  });

  @override
  List<Object> get props => [
        /// Common
        isLoading,
        latestComicNumber,

        /// Data
        comicList,
        loadMore,
        loadedDataCount,
        totalDataCount,
      ];

  ComicListState copyWith({
    /// Common
    bool isLoading,
    int latestComicNumber,

    /// Data
    List<Comic> comicList,
    bool loadMore,
    int loadedDataCount,
    int totalDataCount,
  }) {
    return ComicListState(
      /// Common
      isLoading: isLoading ?? this.isLoading,
      latestComicNumber: latestComicNumber ?? this.latestComicNumber,

      /// Data
      comicList: comicList ?? this.comicList,
      loadMore: loadMore ?? this.loadMore,
      loadedDataCount: loadedDataCount ?? this.loadedDataCount,
      totalDataCount:  totalDataCount ?? this.totalDataCount,
    );
  }
}
