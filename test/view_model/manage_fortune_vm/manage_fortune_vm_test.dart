import 'package:flutter_test/flutter_test.dart';
import 'package:fortune_gallery/_lib.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

// Import the generated mock file
import 'manage_fortune_vm_test.mocks.dart';

@GenerateMocks([FortuneRepo])
class MockProgressService extends Mock implements ProgressService {}

void main() {
  // Ensure that the Flutter binding is initialized
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockFortuneRepo mockFortuneRepo;
  late ManageFortuneVm manageFortuneVm;
  late MockProgressService mockProgressService;

  setUp(() {
    // Clear any existing registrations in GetIt
    GetIt.I.reset();

    // Initialize mock repository and view model
    mockFortuneRepo = MockFortuneRepo();
    mockProgressService = MockProgressService();

    // Register dependencies in GetIt
    GetIt.I.registerSingleton<FortuneRepo>(mockFortuneRepo);
    GetIt.I.registerSingleton<ProgressService>(mockProgressService);

    // Initialize the view model with the mock repository
    manageFortuneVm = ManageFortuneVm(mockFortuneRepo);
  });

  tearDown(() {
    // Reset GetIt after each test
    GetIt.I.reset();
  });

  final fortune = FortuneModel(
    id: 1,
    message: 'Test fortune',
    dateCreated: "2023-09-12",
  );

  group('ManageFortuneVm Tests', () {
    test(
        'addFortune should return a successful response when the repository call is successful',
        () async {
      // Arrange
      final response =
          BaseResponse(status: true, message: 'Fortune added successfully');
      when(mockFortuneRepo.addFortune(fortune))
          .thenAnswer((_) async => response);

      // Act
      final result = await manageFortuneVm.addFortune(data: fortune);

      // Assert
      expect(result.status, true);
      expect(result.message, 'Fortune added successfully');
      verify(mockFortuneRepo.addFortune(fortune)).called(1);
    });

    test(
        'addFortune should return an error response when the repository call fails',
        () async {
      // Arrange
      final response =
          BaseResponse(status: false, message: 'Error adding fortune');
      when(mockFortuneRepo.addFortune(fortune))
          .thenAnswer((_) async => response);

      // Act
      final result = await manageFortuneVm.addFortune(data: fortune);

      // Assert
      expect(result.status, false);
      expect(result.message, 'Error adding fortune');
      verify(mockFortuneRepo.addFortune(fortune)).called(1);
    });

    test(
        'updateFortune should return a successful response when the repository call is successful',
        () async {
      // Arrange
      final response = BaseResponse<FortuneModel>(
          status: true, message: 'Fortune updated successfully');
      when(mockFortuneRepo.updateFortune(fortune))
          .thenAnswer((_) async => response);

      // Act
      final result = await manageFortuneVm.updateFortune(data: fortune);

      // Assert
      expect(result.status, true);
      expect(result.message, 'Fortune updated successfully');
      verify(mockFortuneRepo.updateFortune(fortune)).called(1);
    });

    test(
        'updateFortune should return an error response when the repository call fails',
        () async {
      // Arrange
      final response = BaseResponse<FortuneModel>(
          status: false, message: 'Error updating fortune');
      when(mockFortuneRepo.updateFortune(fortune))
          .thenAnswer((_) async => response);

      // Act
      final result = await manageFortuneVm.updateFortune(data: fortune);

      // Assert
      expect(result.status, false);
      expect(result.message, 'Error updating fortune');
      verify(mockFortuneRepo.updateFortune(fortune)).called(1);
    });

    test(
        'deleteFortune should return a successful response when the repository call is successful',
        () async {
      // Arrange
      final response = BaseResponse<int>(
          status: true, message: 'Fortune deleted successfully');
      when(mockFortuneRepo.deleteFortune(fortune.id!))
          .thenAnswer((_) async => response);

      // Act
      final result = await manageFortuneVm.deleteFortune(id: fortune.id!);

      // Assert
      expect(result.status, true);
      expect(result.message, 'Fortune deleted successfully');
      verify(mockFortuneRepo.deleteFortune(fortune.id!)).called(1);
    });

    test(
        'deleteFortune should return an error response when the repository call fails',
        () async {
      // Arrange
      final response =
          BaseResponse<int>(status: false, message: 'Error deleting fortune');
      when(mockFortuneRepo.deleteFortune(fortune.id!))
          .thenAnswer((_) async => response);

      // Act
      final result = await manageFortuneVm.deleteFortune(id: fortune.id!);

      // Assert
      expect(result.status, false);
      expect(result.message, 'Error deleting fortune');
      verify(mockFortuneRepo.deleteFortune(fortune.id!)).called(1);
    });
  });
}
