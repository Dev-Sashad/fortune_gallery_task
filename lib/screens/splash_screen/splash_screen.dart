import 'package:flutter/material.dart';
import 'package:fortune_gallery/_lib.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> with UIToolMixin {
  @override
  void initState() {
    delay(2).then(
        (value) => navigationService.navigateReplacement(const HomeSreen()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
