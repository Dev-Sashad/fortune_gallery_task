import 'package:fortune_gallery/_lib.dart';

// This class represents the state of the home screen
class HomeState {
  final LoadingState viewState;
  final LoadingState? getMoreState;
  final List<FortuneModel>? data;
  final int? totalTablelCount;
  int get nextPageRange => data!.length;

  const HomeState._(
      {required this.viewState,
      this.data,
      this.getMoreState,
      this.totalTablelCount});

  factory HomeState.initial() => const HomeState._(
      viewState: LoadingState.idle,
      getMoreState: LoadingState.idle,
      data: [],
      totalTablelCount: 0);

  HomeState copyWith(
      {List<FortuneModel>? data,
      LoadingState? viewState,
      LoadingState? getMoreState,
      int? totalTablelCount}) {
    return HomeState._(
        data: data ?? this.data,
        viewState: viewState ?? this.viewState,
        getMoreState: getMoreState ?? this.getMoreState,
        totalTablelCount: totalTablelCount ?? this.totalTablelCount);
  }
}
