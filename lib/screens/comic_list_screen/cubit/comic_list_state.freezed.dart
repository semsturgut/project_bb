// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'comic_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ComicListStateTearOff {
  const _$ComicListStateTearOff();

  InitialState initial() {
    return const InitialState();
  }

  ShowLoading showLoading({int loadedDataCount, int totalDataCount}) {
    return ShowLoading(
      loadedDataCount: loadedDataCount,
      totalDataCount: totalDataCount,
    );
  }

  ShowError showError({String error}) {
    return ShowError(
      error: error,
    );
  }

  ShowView showView(
      {bool moreLoading,
      int loadedDataCount,
      int totalDataCount,
      List<Comic> comicList,
      int reloadComicIndex}) {
    return ShowView(
      moreLoading: moreLoading,
      loadedDataCount: loadedDataCount,
      totalDataCount: totalDataCount,
      comicList: comicList,
      reloadComicIndex: reloadComicIndex,
    );
  }
}

// ignore: unused_element
const $ComicListState = _$ComicListStateTearOff();

mixin _$ComicListState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result showLoading(int loadedDataCount, int totalDataCount),
    @required Result showError(String error),
    @required
        Result showView(bool moreLoading, int loadedDataCount,
            int totalDataCount, List<Comic> comicList, int reloadComicIndex),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result showLoading(int loadedDataCount, int totalDataCount),
    Result showError(String error),
    Result showView(bool moreLoading, int loadedDataCount, int totalDataCount,
        List<Comic> comicList, int reloadComicIndex),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialState value),
    @required Result showLoading(ShowLoading value),
    @required Result showError(ShowError value),
    @required Result showView(ShowView value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialState value),
    Result showLoading(ShowLoading value),
    Result showError(ShowError value),
    Result showView(ShowView value),
    @required Result orElse(),
  });
}

abstract class $ComicListStateCopyWith<$Res> {
  factory $ComicListStateCopyWith(
          ComicListState value, $Res Function(ComicListState) then) =
      _$ComicListStateCopyWithImpl<$Res>;
}

class _$ComicListStateCopyWithImpl<$Res>
    implements $ComicListStateCopyWith<$Res> {
  _$ComicListStateCopyWithImpl(this._value, this._then);

  final ComicListState _value;
  // ignore: unused_field
  final $Res Function(ComicListState) _then;
}

abstract class $InitialStateCopyWith<$Res> {
  factory $InitialStateCopyWith(
          InitialState value, $Res Function(InitialState) then) =
      _$InitialStateCopyWithImpl<$Res>;
}

class _$InitialStateCopyWithImpl<$Res>
    extends _$ComicListStateCopyWithImpl<$Res>
    implements $InitialStateCopyWith<$Res> {
  _$InitialStateCopyWithImpl(
      InitialState _value, $Res Function(InitialState) _then)
      : super(_value, (v) => _then(v as InitialState));

  @override
  InitialState get _value => super._value as InitialState;
}

class _$InitialState implements InitialState {
  const _$InitialState();

  @override
  String toString() {
    return 'ComicListState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result showLoading(int loadedDataCount, int totalDataCount),
    @required Result showError(String error),
    @required
        Result showView(bool moreLoading, int loadedDataCount,
            int totalDataCount, List<Comic> comicList, int reloadComicIndex),
  }) {
    assert(initial != null);
    assert(showLoading != null);
    assert(showError != null);
    assert(showView != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result showLoading(int loadedDataCount, int totalDataCount),
    Result showError(String error),
    Result showView(bool moreLoading, int loadedDataCount, int totalDataCount,
        List<Comic> comicList, int reloadComicIndex),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialState value),
    @required Result showLoading(ShowLoading value),
    @required Result showError(ShowError value),
    @required Result showView(ShowView value),
  }) {
    assert(initial != null);
    assert(showLoading != null);
    assert(showError != null);
    assert(showView != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialState value),
    Result showLoading(ShowLoading value),
    Result showError(ShowError value),
    Result showView(ShowView value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialState implements ComicListState {
  const factory InitialState() = _$InitialState;
}

abstract class $ShowLoadingCopyWith<$Res> {
  factory $ShowLoadingCopyWith(
          ShowLoading value, $Res Function(ShowLoading) then) =
      _$ShowLoadingCopyWithImpl<$Res>;
  $Res call({int loadedDataCount, int totalDataCount});
}

class _$ShowLoadingCopyWithImpl<$Res> extends _$ComicListStateCopyWithImpl<$Res>
    implements $ShowLoadingCopyWith<$Res> {
  _$ShowLoadingCopyWithImpl(
      ShowLoading _value, $Res Function(ShowLoading) _then)
      : super(_value, (v) => _then(v as ShowLoading));

  @override
  ShowLoading get _value => super._value as ShowLoading;

  @override
  $Res call({
    Object loadedDataCount = freezed,
    Object totalDataCount = freezed,
  }) {
    return _then(ShowLoading(
      loadedDataCount: loadedDataCount == freezed
          ? _value.loadedDataCount
          : loadedDataCount as int,
      totalDataCount: totalDataCount == freezed
          ? _value.totalDataCount
          : totalDataCount as int,
    ));
  }
}

class _$ShowLoading implements ShowLoading {
  const _$ShowLoading({this.loadedDataCount, this.totalDataCount});

  @override
  final int loadedDataCount;
  @override
  final int totalDataCount;

  @override
  String toString() {
    return 'ComicListState.showLoading(loadedDataCount: $loadedDataCount, totalDataCount: $totalDataCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShowLoading &&
            (identical(other.loadedDataCount, loadedDataCount) ||
                const DeepCollectionEquality()
                    .equals(other.loadedDataCount, loadedDataCount)) &&
            (identical(other.totalDataCount, totalDataCount) ||
                const DeepCollectionEquality()
                    .equals(other.totalDataCount, totalDataCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(loadedDataCount) ^
      const DeepCollectionEquality().hash(totalDataCount);

  @override
  $ShowLoadingCopyWith<ShowLoading> get copyWith =>
      _$ShowLoadingCopyWithImpl<ShowLoading>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result showLoading(int loadedDataCount, int totalDataCount),
    @required Result showError(String error),
    @required
        Result showView(bool moreLoading, int loadedDataCount,
            int totalDataCount, List<Comic> comicList, int reloadComicIndex),
  }) {
    assert(initial != null);
    assert(showLoading != null);
    assert(showError != null);
    assert(showView != null);
    return showLoading(loadedDataCount, totalDataCount);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result showLoading(int loadedDataCount, int totalDataCount),
    Result showError(String error),
    Result showView(bool moreLoading, int loadedDataCount, int totalDataCount,
        List<Comic> comicList, int reloadComicIndex),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (showLoading != null) {
      return showLoading(loadedDataCount, totalDataCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialState value),
    @required Result showLoading(ShowLoading value),
    @required Result showError(ShowError value),
    @required Result showView(ShowView value),
  }) {
    assert(initial != null);
    assert(showLoading != null);
    assert(showError != null);
    assert(showView != null);
    return showLoading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialState value),
    Result showLoading(ShowLoading value),
    Result showError(ShowError value),
    Result showView(ShowView value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (showLoading != null) {
      return showLoading(this);
    }
    return orElse();
  }
}

abstract class ShowLoading implements ComicListState {
  const factory ShowLoading({int loadedDataCount, int totalDataCount}) =
      _$ShowLoading;

  int get loadedDataCount;
  int get totalDataCount;
  $ShowLoadingCopyWith<ShowLoading> get copyWith;
}

abstract class $ShowErrorCopyWith<$Res> {
  factory $ShowErrorCopyWith(ShowError value, $Res Function(ShowError) then) =
      _$ShowErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

class _$ShowErrorCopyWithImpl<$Res> extends _$ComicListStateCopyWithImpl<$Res>
    implements $ShowErrorCopyWith<$Res> {
  _$ShowErrorCopyWithImpl(ShowError _value, $Res Function(ShowError) _then)
      : super(_value, (v) => _then(v as ShowError));

  @override
  ShowError get _value => super._value as ShowError;

  @override
  $Res call({
    Object error = freezed,
  }) {
    return _then(ShowError(
      error: error == freezed ? _value.error : error as String,
    ));
  }
}

class _$ShowError implements ShowError {
  const _$ShowError({this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ComicListState.showError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShowError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @override
  $ShowErrorCopyWith<ShowError> get copyWith =>
      _$ShowErrorCopyWithImpl<ShowError>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result showLoading(int loadedDataCount, int totalDataCount),
    @required Result showError(String error),
    @required
        Result showView(bool moreLoading, int loadedDataCount,
            int totalDataCount, List<Comic> comicList, int reloadComicIndex),
  }) {
    assert(initial != null);
    assert(showLoading != null);
    assert(showError != null);
    assert(showView != null);
    return showError(error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result showLoading(int loadedDataCount, int totalDataCount),
    Result showError(String error),
    Result showView(bool moreLoading, int loadedDataCount, int totalDataCount,
        List<Comic> comicList, int reloadComicIndex),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (showError != null) {
      return showError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialState value),
    @required Result showLoading(ShowLoading value),
    @required Result showError(ShowError value),
    @required Result showView(ShowView value),
  }) {
    assert(initial != null);
    assert(showLoading != null);
    assert(showError != null);
    assert(showView != null);
    return showError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialState value),
    Result showLoading(ShowLoading value),
    Result showError(ShowError value),
    Result showView(ShowView value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (showError != null) {
      return showError(this);
    }
    return orElse();
  }
}

abstract class ShowError implements ComicListState {
  const factory ShowError({String error}) = _$ShowError;

  String get error;
  $ShowErrorCopyWith<ShowError> get copyWith;
}

abstract class $ShowViewCopyWith<$Res> {
  factory $ShowViewCopyWith(ShowView value, $Res Function(ShowView) then) =
      _$ShowViewCopyWithImpl<$Res>;
  $Res call(
      {bool moreLoading,
      int loadedDataCount,
      int totalDataCount,
      List<Comic> comicList,
      int reloadComicIndex});
}

class _$ShowViewCopyWithImpl<$Res> extends _$ComicListStateCopyWithImpl<$Res>
    implements $ShowViewCopyWith<$Res> {
  _$ShowViewCopyWithImpl(ShowView _value, $Res Function(ShowView) _then)
      : super(_value, (v) => _then(v as ShowView));

  @override
  ShowView get _value => super._value as ShowView;

  @override
  $Res call({
    Object moreLoading = freezed,
    Object loadedDataCount = freezed,
    Object totalDataCount = freezed,
    Object comicList = freezed,
    Object reloadComicIndex = freezed,
  }) {
    return _then(ShowView(
      moreLoading:
          moreLoading == freezed ? _value.moreLoading : moreLoading as bool,
      loadedDataCount: loadedDataCount == freezed
          ? _value.loadedDataCount
          : loadedDataCount as int,
      totalDataCount: totalDataCount == freezed
          ? _value.totalDataCount
          : totalDataCount as int,
      comicList:
          comicList == freezed ? _value.comicList : comicList as List<Comic>,
      reloadComicIndex: reloadComicIndex == freezed
          ? _value.reloadComicIndex
          : reloadComicIndex as int,
    ));
  }
}

class _$ShowView implements ShowView {
  const _$ShowView(
      {this.moreLoading,
      this.loadedDataCount,
      this.totalDataCount,
      this.comicList,
      this.reloadComicIndex});

  @override
  final bool moreLoading;
  @override
  final int loadedDataCount;
  @override
  final int totalDataCount;
  @override
  final List<Comic> comicList;
  @override
  final int reloadComicIndex;

  @override
  String toString() {
    return 'ComicListState.showView(moreLoading: $moreLoading, loadedDataCount: $loadedDataCount, totalDataCount: $totalDataCount, comicList: $comicList, reloadComicIndex: $reloadComicIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShowView &&
            (identical(other.moreLoading, moreLoading) ||
                const DeepCollectionEquality()
                    .equals(other.moreLoading, moreLoading)) &&
            (identical(other.loadedDataCount, loadedDataCount) ||
                const DeepCollectionEquality()
                    .equals(other.loadedDataCount, loadedDataCount)) &&
            (identical(other.totalDataCount, totalDataCount) ||
                const DeepCollectionEquality()
                    .equals(other.totalDataCount, totalDataCount)) &&
            (identical(other.comicList, comicList) ||
                const DeepCollectionEquality()
                    .equals(other.comicList, comicList)) &&
            (identical(other.reloadComicIndex, reloadComicIndex) ||
                const DeepCollectionEquality()
                    .equals(other.reloadComicIndex, reloadComicIndex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(moreLoading) ^
      const DeepCollectionEquality().hash(loadedDataCount) ^
      const DeepCollectionEquality().hash(totalDataCount) ^
      const DeepCollectionEquality().hash(comicList) ^
      const DeepCollectionEquality().hash(reloadComicIndex);

  @override
  $ShowViewCopyWith<ShowView> get copyWith =>
      _$ShowViewCopyWithImpl<ShowView>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result showLoading(int loadedDataCount, int totalDataCount),
    @required Result showError(String error),
    @required
        Result showView(bool moreLoading, int loadedDataCount,
            int totalDataCount, List<Comic> comicList, int reloadComicIndex),
  }) {
    assert(initial != null);
    assert(showLoading != null);
    assert(showError != null);
    assert(showView != null);
    return showView(moreLoading, loadedDataCount, totalDataCount, comicList,
        reloadComicIndex);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result showLoading(int loadedDataCount, int totalDataCount),
    Result showError(String error),
    Result showView(bool moreLoading, int loadedDataCount, int totalDataCount,
        List<Comic> comicList, int reloadComicIndex),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (showView != null) {
      return showView(moreLoading, loadedDataCount, totalDataCount, comicList,
          reloadComicIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(InitialState value),
    @required Result showLoading(ShowLoading value),
    @required Result showError(ShowError value),
    @required Result showView(ShowView value),
  }) {
    assert(initial != null);
    assert(showLoading != null);
    assert(showError != null);
    assert(showView != null);
    return showView(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(InitialState value),
    Result showLoading(ShowLoading value),
    Result showError(ShowError value),
    Result showView(ShowView value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (showView != null) {
      return showView(this);
    }
    return orElse();
  }
}

abstract class ShowView implements ComicListState {
  const factory ShowView(
      {bool moreLoading,
      int loadedDataCount,
      int totalDataCount,
      List<Comic> comicList,
      int reloadComicIndex}) = _$ShowView;

  bool get moreLoading;
  int get loadedDataCount;
  int get totalDataCount;
  List<Comic> get comicList;
  int get reloadComicIndex;
  $ShowViewCopyWith<ShowView> get copyWith;
}
