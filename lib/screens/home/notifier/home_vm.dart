import 'package:fortune_gallery/_lib.dart';

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
    final count = await _notesRepo.totalTableCount();
    appPrint(count.data);
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
          totalTablelCount: count.data);
      appPrint(state.viewState.name);
    } else {
      state = state.copyWith(
        viewState: LoadingState.error,
      );
    }
  }

  Future<void> refreshFortune() async {
    final result = await _notesRepo.getAllFortune(startFrom: 0);
    final count = await _notesRepo.totalTableCount();
    appPrint(count.data);
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
          totalTablelCount: count.data);
      appPrint(state.viewState.name);
    }
  }

  Future<void> getMoreFortune() async {
    if (state.totalTablelCount! > 0 &&
        state.totalTablelCount! > state.data!.length) {
      state = state.copyWith(
        getMoreState: LoadingState.loading,
      );
      await delay();
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
        state = state.copyWith(getMoreState: LoadingState.idle, data: data);
        appPrint(state.getMoreState!.name);
      } else {
        state = state.copyWith(
          getMoreState: LoadingState.idle,
        );
      }
    } else {
      state = state.copyWith(
        getMoreState: LoadingState.idle,
      );
    }
  }
}

final homeVm = StateNotifierProvider<HomeVm, HomeState>(
    (ref) => HomeVm(locator<FortuneRepo>()));
