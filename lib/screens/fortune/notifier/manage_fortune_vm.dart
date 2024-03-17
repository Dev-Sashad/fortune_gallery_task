import 'package:fortune_gallery/_lib.dart';

class ManageFortuneVm extends BaseModel {
  final FortuneRepo _notesRepo;
  final HomeVm _homeVm;
  ManageFortuneVm(this._notesRepo, this._homeVm);
// Add an item
  Future<bool> addFortune({required FortuneModel data}) async {
    try {
      setBusy(true);
      await delay(2);
      final result = await _notesRepo.addFortune(data);
      if (result.status) {
        await _homeVm.refreshFortune();
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
      await delay(1);
      final result = await _notesRepo.updateFortune(data);
      if (result.status) {
        await _homeVm.refreshFortune();
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
      await delay(1);
      final result = await _notesRepo.deleteFortune(id);
      if (result.status) {
        await _homeVm.refreshFortune();
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

final manageFortuenVm = ChangeNotifierProvider<ManageFortuneVm>((ref) =>
    ManageFortuneVm(locator<FortuneRepo>(), ref.watch(homeVm.notifier)));
