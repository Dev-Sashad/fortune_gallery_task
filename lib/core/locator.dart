import 'package:fortune_gallery/_lib.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  //Services
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ProgressService());

  //LocalDataRequest
  locator.registerLazySingleton<FortuneRepo>(
      () => FortuneRepoImpl(database: LocalDatabase.instance));
}
