import 'package:flutter/material.dart';
import 'package:fortune_gallery/_lib.dart';

class BaseModel extends ChangeNotifier {
  final ProgressService _dialogService = locator<ProgressService>();
  ProgressResponse hh = ProgressResponse(confirmed: false);

  bool _busy = false;
  bool get busy => _busy;

//This tells the app, the app is busy and dialog starts immediately and ends if it is equal to false
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
    if (value == true) {
      _dialogService.showDialog();
    } else {
      _dialogService.dialogComplete(hh);
    }
  }
}
