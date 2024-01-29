import 'package:flutter/material.dart';
import 'package:introduce_your_city_task/feature/home/home_view.dart';
import 'package:introduce_your_city_task/product/constants/color_constants.dart';
import 'package:introduce_your_city_task/product/constants/image_constants.dart';
import 'package:introduce_your_city_task/product/initialize/application_start.dart';
import 'package:introduce_your_city_task/product/utility/routes/routes.dart';
import 'package:kartal/kartal.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getInitData();
  }

  Future<void> getInitData() async {
    await ApplicationStart.init();
     _goToHome();
  }

  void _goToHome(){
    goToPushAndRemoveUntil(context: context, route: const HomeView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.sized.height,
        width: context.sized.width,
        color: ColorConstants.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageConstants.appIcon.toSvgImage,
            SizedBox(
              height:context.sized.dynamicHeight(.1),
              child: ImageConstants.imageLoadingLottie.toLottie)
          ],
        ),
      ),
    );
  }
}
