import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:property_management_system/feature/favorite_screen/favorite_screen.dart';
import 'package:property_management_system/feature/login_screen/login_screen.dart';
import 'package:property_management_system/feature/reigster/reigster_screen.dart';
import 'package:property_management_system/feature/settings_screen/settings_screen.dart';
import 'package:property_management_system/feature/splash_screen/slpash_screen.dart';
import 'package:property_management_system/injection_container.dart';

import 'feature/cubit/main_cubit.dart';
import 'feature/home_screen/home_screen.dart';

void main() {
  init();
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal,
          titleTextStyle: TextStyle(color: Colors.white),
          centerTitle: true,

          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          // ignore: deprecated_member_use
          textTheme: TextTheme(
            bodyText1: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontFamily: 'MontserratThin'),
            bodyText2: TextStyle(
                color: Color(0xf7BD5F5),
                fontSize: 25.0,
                fontWeight: FontWeight.w600),
          ),

          iconTheme: IconThemeData(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black, size: 30),
        textTheme: TextTheme(
          bodyText1: TextStyle(
              color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
      ),
      themeMode: sl<MainCubit>().isDark ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Color(0xFF333739),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal,
          titleTextStyle: TextStyle(color: Colors.white),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xFF333739),
            statusBarIconBrightness: Brightness.light,
          ),

          iconTheme: IconThemeData(color: Colors.white),
          // ignore: deprecated_member_use
          textTheme: TextTheme(
            bodyText1: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w600),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white, size: 30),
        textTheme: TextTheme(
          bodyText1: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: LoaderOverlay(
        useDefaultLoading: false,
        overlayWidget: Center(
            child: SpinKitSpinningLines(
          color: Colors.teal,
          size: 50.0,
        )),
        child: HomeScreen(),
      ),
    );
  }
}
