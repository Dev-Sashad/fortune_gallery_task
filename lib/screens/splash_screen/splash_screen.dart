import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fortune_gallery/_lib.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> with UIToolMixin {
  @override
  void initState() {
    // Hide system overlays for the splash screen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    delay(2).then((value) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      navigationService.navigateReplacement(const HomeScreen());
    });
    super.initState();
  }

  @override
  void dispose() {
    // Ensure system overlays are restored when the widget is disposed
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      extendBody: true,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              AppStrings.appTitle.toUpperCase(),
              textAlign: TextAlign.center,
              textType: TextType.largeText,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            )
          ],
        ),
      ),
    );
  }
}
