class FortuneModel {
  final int? id;
  final String? message;
  final DateTime? dateCreated;
  FortuneModel({
    this.id,
    required this.message,
    required this.dateCreated,
  });

  static const String tableName = 'fortunes_table';
  static const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static const String textType = 'TEXT NOT NULL';
  static const String idKey = '_id';
  static const String messageKey = 'message';
  static const String dateCreatedKey = 'date_created';

  static const List<String> tableFields = [idKey, messageKey, dateCreatedKey];

  Map<String, Object?> toJson() => {
        idKey: id,
        messageKey: message,
        dateCreatedKey: dateCreated.toString(),
      };

  factory FortuneModel.fromJson(Map<String, Object?> json) => FortuneModel(
        id: int.parse(json[FortuneModel.idKey].toString()),
        message: json[FortuneModel.messageKey].toString(),
        dateCreated:
            DateTime.tryParse(json[FortuneModel.dateCreatedKey].toString()),
      );

  FortuneModel copy({
    int? id,
    String? message,
    DateTime? dateCreated,
  }) =>
      FortuneModel(
          id: id ?? this.id,
          message: message ?? this.message,
          dateCreated: dateCreated ?? this.dateCreated);
}
