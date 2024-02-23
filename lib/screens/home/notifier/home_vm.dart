import 'package:fortune_gallery/_lib.dart';
import 'package:fortune_gallery/utils/extension.dart';

class HomeVm extends StateNotifier<HomeState> {
  HomeVm(this._notesRepo) : super(HomeState.initial()) {
    getAllFortune();
  }
  final FortuneRepo _notesRepo;

  Future<void> getAllFortune() async {
    state = state.copyWith(
      viewState: LoadingState.loading,
    );
    await delay();
    final result = await _notesRepo.getAllFortune(startFrom: 0);
    if (result.status) {
      List<FortuneModel> data = [];
      if (result.data!.isNotEmpty) {
        for (FortuneModel val in result.data!) {
          if (!data.contains(val) && !state.data!.contains(val)) {
            data.add(val);
          }
        }
      }
      state = state.copyWith(
          viewState: LoadingState.idle,
          data: data,
          noMoreData: result.data!.isEmpty);
      appPrint(state.viewState.name);
    } else {
      state = state.copyWith(
        viewState: LoadingState.error,
      );
    }
  }

  Future<void> refreshFortune() async {
    final result = await _notesRepo.getAllFortune(startFrom: 0);
    if (result.status) {
      List<FortuneModel> data = [];
      if (result.data!.isNotEmpty) {
        for (FortuneModel val in result.data!) {
          if (!data.contains(val) && !state.data!.contains(val)) {
            data.add(val);
          }
        }
      }
      state = state.copyWith(
          viewState: LoadingState.idle,
          data: data,
          noMoreData: result.data!.isEmpty);
      appPrint(state.viewState.name);
    }
  }

  Future<void> getMoreFortune() async {
    if (state.noMoreData! == false && !state.getMoreState!.isLoading) {
      state = state.copyWith(
        getMoreState: LoadingState.loading,
      );
      await delay();
      appPrint(state.nextPageRange);
      final result =
          await _notesRepo.getAllFortune(startFrom: state.nextPageRange);
      if (result.status) {
        List<FortuneModel> data = [];
        if (result.data!.isNotEmpty) {
          for (FortuneModel val in result.data!) {
            if (!data.contains(val) && !state.data!.contains(val)) {
              data.add(val);
            }
          }
        }
        state = state.copyWith(
            getMoreState: LoadingState.idle,
            data: [...state.data!, ...data],
            noMoreData: result.data!.isEmpty);
      } else {
        state = state.copyWith(
          getMoreState: LoadingState.idle,
        );
      }
    }
  }
}

final homeVm = StateNotifierProvider<HomeVm, HomeState>(
    (ref) => HomeVm(locator<FortuneRepo>()));
