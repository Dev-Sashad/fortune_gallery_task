import 'package:fortune_gallery/_lib.dart';

class ManageFortuneVm extends BaseModel {
  final FortuneRepo _notesRepo;
  ManageFortuneVm(this._ref, this._notesRepo);
  final Ref _ref;

// Add an item
  Future<bool> addFortune({required FortuneModel data}) async {
    try {
      setBusy(true);
      await delay();
      final result = await _notesRepo.addFortune(data);
      if (result.status) {
        _ref.read(homeVm.notifier).state.data![0] = result.data!;
        notifyListeners();
        setBusy(false);
        return true;
      } else {
        setBusy(false);
        showOkayDialog(message: result.message ?? "");
        return false;
      }
    } catch (e) {
      appPrint(e);
      setBusy(false);
      showOkayDialog(message: "Error");
      return false;
    }
  }

// update an item
  Future<bool> updateFortune({required FortuneModel data}) async {
    try {
      setBusy(true);
      await delay();
      final result = await _notesRepo.updateFortune(data);
      if (result.status) {
        final index = _ref
            .read(homeVm.notifier)
            .state
            .data!
            .indexWhere((e) => e.id == data.id);
        _ref.read(homeVm.notifier).state.data![index] = result.data!;
        notifyListeners();
        setBusy(false);
        return true;
      } else {
        setBusy(false);
        showOkayDialog(message: result.message ?? "");
        return false;
      }
    } catch (e) {
      appPrint(e);
      setBusy(false);
      showOkayDialog(message: "Error");
      return false;
    }
  }

// Delete an item
  Future<bool> deleteFortune({required int id}) async {
    try {
      setBusy(true);
      await delay();
      final result = await _notesRepo.deleteFortune(id);

      if (result.status) {
        _ref.read(homeVm.notifier).state.data!.removeWhere((e) => e.id == id);
        notifyListeners();
        setBusy(false);
        return true;
      } else {
        setBusy(false);
        showOkayDialog(message: result.message ?? "");
        return false;
      }
    } catch (e) {
      appPrint(e);
      setBusy(false);
      showOkayDialog(message: "Error");
      return false;
    }
  }
}

final manageFortuenVm = ChangeNotifierProvider<ManageFortuneVm>(
    (ref) => ManageFortuneVm(ref, locator<FortuneRepo>()));
