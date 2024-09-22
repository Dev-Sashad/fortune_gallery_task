import 'package:flutter_test/flutter_test.dart';
import 'package:fortune_gallery/_lib.dart';
import 'package:mockito/mockito.dart';

import '../data_source/database_test.mocks.dart';
import '../data_source/local_database_test.mocks.dart';

// Import the generated mock file

void main() {
  late MockLocalDatabase mockLocalDatabase;
  late FortuneRepoImpl repo;

  setUp(() {
    mockLocalDatabase = MockLocalDatabase();
    repo = FortuneRepoImpl(database: mockLocalDatabase);
  });

  group('FortuneRepoImpl Tests', () {
    final fortune = FortuneModel(
      id: 1,
      message: 'Test fortune',
      dateCreated: "2023-09-12",
    );

    test(
        'addFortune should return a successful response when the insert is successful',
        () async {
      // Arrange
      final db = MockDatabase();
      when(mockLocalDatabase.database).thenAnswer((_) async => db);
      when(db.insert(any, any)).thenAnswer((_) async => 1);

      // Act
      final response = await repo.addFortune(fortune);

      // Assert
      expect(response.status, true);
      expect(response.data?.id, 1);
      expect(response.message, "Note succesfully save");
    });

    test(
        'addFortune should return an error response when an exception is thrown',
        () async {
      // Arrange
      final db = MockDatabase();
      when(mockLocalDatabase.database).thenAnswer((_) async => db);
      when(db.insert(any, any)).thenThrow(Exception());

      // Act
      final response = await repo.addFortune(fortune);

      // Assert
      expect(response.status, false);
      expect(response.message, "Error");
    });

    test('getAllFortune should return a list of fortunes', () async {
      // Arrange
      final db = MockDatabase();
      final mockData = [
        {'id': 1, 'message': 'Fortune 1', 'dateCreated': '2023-09-12'},
        {'id': 2, 'message': 'Fortune 2', 'dateCreated': '2023-09-13'}
      ];
      when(mockLocalDatabase.database).thenAnswer((_) async => db);
      when(db.query(any,
              orderBy: anyNamed('orderBy'),
              limit: anyNamed('limit'),
              offset: anyNamed('offset')))
          .thenAnswer((_) async => mockData);

      // Act
      final response = await repo.getAllFortune();

      // Assert
      expect(response.status, true);
      expect(response.data?.length, 2);
      expect(response.data?.first.message, 'Fortune 1');
    });

    test('totalTableCount should return the correct count', () async {
      // Arrange
      final db = MockDatabase();
      when(mockLocalDatabase.database).thenAnswer((_) async => db);
      when(db.rawQuery("SELECT COUNT(*) FROM ${FortuneModel.tableName}"))
          .thenAnswer((_) async => [
                {'COUNT(*)': 5}
              ]);

      // Act
      final response = await repo.totalTableCount();

      // Assert
      expect(response.status, true);
      expect(response.data, 5);
    });
  });
}
