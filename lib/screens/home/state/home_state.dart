import 'package:fortune_gallery/_lib.dart';

class HomeState {
  final LoadingState viewState;
  final LoadingState? getMoreState;
  final List<FortuneModel> data; // Make data non-nullable
  final bool? noMoreData;

  int get nextPageRange => data.length; // Safe to use length now

  HomeState._({
    required this.viewState,
    this.getMoreState,
    List<FortuneModel>? data,
    this.noMoreData,
  }) : data = data ?? []; // Initialize to an empty list if null

  factory HomeState.initial() => HomeState._(
        viewState: LoadingState.idle,
        getMoreState: LoadingState.idle,
        data: [], // Initializing with an empty list
        noMoreData: false,
      );

  HomeState copyWith({
    List<FortuneModel>? data,
    LoadingState? viewState,
    LoadingState? getMoreState,
    bool? noMoreData,
  }) {
    return HomeState._(
      data: data ?? this.data,
      viewState: viewState ?? this.viewState,
      getMoreState: getMoreState ?? this.getMoreState,
      noMoreData: noMoreData ?? this.noMoreData,
    );
  }
}
