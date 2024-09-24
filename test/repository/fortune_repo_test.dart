import 'package:flutter_test/flutter_test.dart';
import 'package:fortune_gallery/_lib.dart';
import 'package:mockito/mockito.dart';

import '../data_source/database_test.mocks.dart';
import '../data_source/local_database_test.mocks.dart';

void main() {
  late MockLocalDatabase mockLocalDatabase;
  late FortuneRepoImpl repo;
  late MockDatabase mockDatabase;

  setUp(() {
    // Initialize the mock database and repo
    mockLocalDatabase = MockLocalDatabase();
    mockDatabase = MockDatabase();
    repo = FortuneRepoImpl(database: mockLocalDatabase);

    // Set up the mock database instance to be returned when accessed
    when(mockLocalDatabase.database).thenAnswer((_) async => mockDatabase);
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
      when(mockDatabase.insert(any, any)).thenAnswer((_) async => 1);

      // Act
      final response = await repo.addFortune(fortune);

      // Assert
      expect(response.status, true);
      expect(response.data?.id, fortune.id);
      expect(response.message, "Note successfully saved");
    });

    test(
        'addFortune should return an error response when an exception is thrown',
        () async {
      // Arrange
      when(mockDatabase.insert(any, any)).thenThrow(Exception());

      // Act
      final response = await repo.addFortune(fortune);

      // Assert
      expect(response.status, false);
      expect(response.message, "Error");
    });

    test('getAllFortune should return a list of fortunes', () async {
      // Arrange
      final mockData = [
        {'_id': "1", 'message': 'Fortune 1', 'date_created': '2023-09-12'},
        {'_id': "2", 'message': 'Fortune 2', 'date_created': '2023-09-13'}
      ];
      when(mockDatabase.query(
        FortuneModel.tableName,
        orderBy: '${FortuneModel.dateCreatedKey} DESC',
        limit: 20,
        offset: 0,
      )).thenAnswer((_) async => mockData);

      // Act
      final response = await repo.getAllFortune();

      // Debugging Print Statements
      print('Query Result: ${response.toJson()}');
      print('Response: ${response.status}');
      print('Response Data: ${response.data}');
      print('Response Message: ${response.message}');

      // Assert
      expect(response.status, true);
      expect(response.data?.length, 2);
      expect(response.data?.first.message, 'Fortune 1');
    });

    test('totalTableCount should return the correct count', () async {
      // Arrange
      when(mockDatabase
              .rawQuery("SELECT COUNT(*) FROM ${FortuneModel.tableName}"))
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
