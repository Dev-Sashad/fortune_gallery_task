import 'package:fortune_gallery/_lib.dart';
import 'package:sqflite/sqflite.dart';

abstract class FortuneRepo {
  Future<BaseResponse<dynamic>> addFortune(FortuneModel note);
  Future<BaseResponse<FortuneModel>> updateFortune(FortuneModel note);
  Future<BaseResponse<int>> deleteFortune(int id);
  Future<BaseResponse<FortuneModel>> getSingleFortune(int id);
  Future<BaseResponse<List<FortuneModel>>> getAllFortune(
      {int startFrom, int limit});
  Future<BaseResponse<int>> totalTableCount();
}

class FortuneRepoImpl implements FortuneRepo {
  final LocalDatabase database;
  FortuneRepoImpl({required this.database});

//Add a fortune from database
  @override
  Future<BaseResponse<FortuneModel>> addFortune(FortuneModel note) async {
    try {
      final db = await database.database;
      final id = await db.insert(FortuneModel.tableName, note.toJson());

      return BaseResponse(
          data: note.copy(id: id),
          status: true,
          message: AppStrings.noteSavedMsg);
    } catch (e) {
      return BaseResponse(status: false, message: AppStrings.error);
    }
  }

//Update a fortune from database
  @override
  Future<BaseResponse<FortuneModel>> updateFortune(FortuneModel note) async {
    try {
      final db = await database.database;
      final id = await db.update(
        FortuneModel.tableName,
        note.toJson(),
        where: '${FortuneModel.idKey} = ?',
        whereArgs: [note.id],
      );

      return BaseResponse(
          data: note.copy(id: id),
          status: true,
          message: AppStrings.noteSavedMsg);
    } catch (e) {
      return BaseResponse(status: false, message: AppStrings.error);
    }
  }

//Delete a fortune from database
  @override
  Future<BaseResponse<int>> deleteFortune(int id) async {
    try {
      final db = await database.database;
      final result = await db.delete(
        FortuneModel.tableName,
        where: '${FortuneModel.idKey} = ?',
        whereArgs: [id],
      );
      return BaseResponse(
          data: result, status: true, message: AppStrings.noteSavedMsg);
    } catch (e) {
      return BaseResponse(status: false, message: AppStrings.error);
    }
  }

//Fetch single fortune from database
  @override
  Future<BaseResponse<FortuneModel>> getSingleFortune(int id) async {
    try {
      final db = await database.database;
      final result = await db.query(
        FortuneModel.tableName,
        columns: FortuneModel.tableFields,
        where: '${FortuneModel.idKey} = ?',
        whereArgs: [id],
      );

      if (result.isNotEmpty) {
        return BaseResponse(
            data: FortuneModel.fromJson(result.first),
            status: true,
            message: AppStrings.success);
      } else {
        return BaseResponse(
            status: false, message: AppStrings.notFound(value: id.toString()));
      }
    } catch (e) {
      return BaseResponse(status: false, message: AppStrings.error);
    }
  }

//Fetch all fortunes from database
  @override
  Future<BaseResponse<List<FortuneModel>>> getAllFortune(
      {int startFrom = 0, int limit = 20}) async {
    try {
      final db = await database.database;
      const orderBy = '${FortuneModel.dateCreatedKey} DESC';
      final result = await db.query(
        FortuneModel.tableName,
        orderBy: orderBy,
        limit: limit,
        offset: startFrom,
      );

      if (result.isNotEmpty) {
        return BaseResponse(
            data: result.map((json) => FortuneModel.fromJson(json)).toList(),
            status: true,
            message: AppStrings.success);
      } else {
        return BaseResponse(
            status: true, message: AppStrings.notFound().trim(), data: []);
      }
    } catch (e) {
      return BaseResponse(status: false, message: AppStrings.error);
    }
  }

//The the total number of items in the fortune database
  @override
  Future<BaseResponse<int>> totalTableCount() async {
    try {
      final db = await database.database;

      final result = Sqflite.firstIntValue(
          await db.rawQuery("SELECT COUNT(*) FROM ${FortuneModel.tableName}"));

      return BaseResponse(
          data: result ?? 0, status: true, message: AppStrings.success);
    } catch (e) {
      return BaseResponse(status: false, message: AppStrings.error, data: 0);
    }
  }
}
