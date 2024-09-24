import 'package:fortune_gallery/_lib.dart';

class ManageFortuneVm extends BaseModel {
  final FortuneRepo _notesRepo;
  ManageFortuneVm(this._notesRepo);
// Add an item
  Future<BaseResponse<dynamic>> addFortune({required FortuneModel data}) async {
    await delay(2);
    final result = await _notesRepo.addFortune(data);
    return result;
  }

// update an item
  Future<BaseResponse<FortuneModel>> updateFortune(
      {required FortuneModel data}) async {
    await delay(1);
    final result = await _notesRepo.updateFortune(data);
    return result;
  }

//Delete an item
  Future<BaseResponse<int>> deleteFortune({required int id}) async {
    await delay(1);
    final result = await _notesRepo.deleteFortune(id);
    return result;
  }
}

final manageFortuenVm = ChangeNotifierProvider<ManageFortuneVm>(
    (ref) => ManageFortuneVm(locator<FortuneRepo>()));
