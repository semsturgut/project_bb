part of 'comic_list_cubit.dart';

class ComicListState extends Equatable {
  /// Common
  final bool pageIsLoading;
  final int latestComicNumber;

  /// Data
  final List<Comic> comicList;
  final bool moreLoading;
  final int loadedDataCount;
  final int totalDataCount;

  const ComicListState({
    /// Common
    this.pageIsLoading,
    this.latestComicNumber,

    /// Data
    this.comicList,
    this.moreLoading,
    this.loadedDataCount,
    this.totalDataCount,
  });

  @override
  List<Object> get props => [
        /// Common
        pageIsLoading,
        latestComicNumber,

        /// Data
        comicList,
        moreLoading,
        loadedDataCount,
        totalDataCount,
      ];

  ComicListState copyWith({
    /// Common
    bool pageIsLoading,
    int latestComicNumber,

    /// Data
    List<Comic> comicList,
    bool moreLoading,
    int loadedDataCount,
    int totalDataCount,
  }) {
    return ComicListState(
      /// Common
      pageIsLoading: pageIsLoading ?? this.pageIsLoading,
      latestComicNumber: latestComicNumber ?? this.latestComicNumber,

      /// Data
      comicList: comicList ?? this.comicList,
      moreLoading: moreLoading ?? this.moreLoading,
      loadedDataCount: loadedDataCount ?? this.loadedDataCount,
      totalDataCount:  totalDataCount ?? this.totalDataCount,
    );
  }
}
