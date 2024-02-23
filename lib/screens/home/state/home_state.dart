import 'package:fortune_gallery/_lib.dart';

// This class represents the state of the home screen
class HomeState {
  final LoadingState viewState;
  final LoadingState? getMoreState;
  final List<FortuneModel>? data;
  final bool? noMoreData;
  int get nextPageRange => data!.length;

  const HomeState._(
      {required this.viewState, this.data, this.getMoreState, this.noMoreData});

  factory HomeState.initial() => const HomeState._(
      viewState: LoadingState.idle,
      getMoreState: LoadingState.idle,
      data: [],
      noMoreData: false);

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
        noMoreData: noMoreData ?? this.noMoreData);
  }
}
