import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fortune_gallery/_lib.dart';
import 'package:get/get.dart';

void main() async {
  setupLocator();
  await LocalDatabase.instance.initDatabase();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: AppColors.white,
    ));
    return DismissableKeyboardFeature(
      child: ScreenUtilInit(
          designSize: const Size(428, 926),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppStrings.appTitle,
              builder: (context, child) => Navigator(
                key: locator<ProgressService>().progressNavigationKey,
                onGenerateRoute: (settings) => MaterialPageRoute(
                  builder: (context) {
                    return ProgressManager(child: child!);
                  },
                ),
              ),
              navigatorKey: locator<NavigationService>().navigationKey,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode.light,
              home: const SplashScreen(),
              onGenerateRoute: generateRoute,
            );
          }),
    );
  }
}
