import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fortune_gallery/_lib.dart';
import '../home_vm/home_vm_test.mocks.dart';

@GenerateMocks([FortuneRepo])
void main() {
  late MockFortuneRepo mockFortuneRepo;
  late HomeVm homeVm;

  setUp(() {
    mockFortuneRepo = MockFortuneRepo();
    homeVm = HomeVm(mockFortuneRepo);
  });

  group('HomeVm Tests', () {
    group('getAllFortune Tests', () {
      test('should set viewState to idle initially', () async {
        // Arrange
        final response = BaseResponse<List<FortuneModel>>(
            status: true, data: [], message: 'Success');
        when(mockFortuneRepo.getAllFortune(startFrom: 0))
            .thenAnswer((_) async => response);

        // Act
        await homeVm.getAllFortune();

        // Assert
        expect(homeVm.state.viewState, LoadingState.idle);
      });

      test('should update state with data on success', () async {
        when(mockFortuneRepo.getAllFortune(startFrom: 0))
            .thenAnswer((_) async => BaseResponse<List<FortuneModel>>(
                  status: true,
                  data: [
                    FortuneModel(
                        id: 1, message: 'Fortune 1', dateCreated: '2023-09-12'),
                    FortuneModel(
                        id: 2, message: 'Fortune 2', dateCreated: '2023-09-13'),
                  ],
                  message: 'Success',
                ));

        // Act
        await homeVm.getAllFortune();
        // Assert
        expect(homeVm.state.viewState, LoadingState.idle);
        expect(homeVm.state.data.length, 2);
      });

      test('should set noMoreData to true when no data is fetched', () async {
        // Arrange
        final response = BaseResponse<List<FortuneModel>>(
            status: true, data: [], message: 'No data');
        when(mockFortuneRepo.getAllFortune(startFrom: 0))
            .thenAnswer((_) async => response);

        // Act
        await homeVm.getAllFortune();

        // Assert
        expect(homeVm.state.noMoreData, true);
      });

      test('should set viewState to error on failure', () async {
        // Arrange
        final response = BaseResponse<List<FortuneModel>>(
            status: false, data: [], message: 'Error');
        when(mockFortuneRepo.getAllFortune(startFrom: 0))
            .thenAnswer((_) async => response);

        // Act
        await homeVm.getAllFortune();

        // Assert
        expect(homeVm.state.viewState, LoadingState.error);
      });

      test('should not update state if no new data is received', () async {
        // Arrange
        final existingFortuneList = [
          FortuneModel(id: 1, message: 'Fortune 1', dateCreated: '2023-09-12'),
        ];
        homeVm.state = homeVm.state.copyWith(
            data: existingFortuneList,
            noMoreData: false,
            getMoreState: LoadingState.idle);

        when(mockFortuneRepo.getAllFortune(startFrom: 0))
            .thenAnswer((_) async => BaseResponse<List<FortuneModel>>(
                  status: true,
                  data: [],
                  message: 'Success',
                ));

        // Act
        await homeVm.getAllFortune();

        // Assert
        expect(homeVm.state.noMoreData, true);
        expect(homeVm.state.getMoreState, LoadingState.idle);
        expect(homeVm.state.data, existingFortuneList);
      });
    });
  });
}
