import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoliday_llp/routes/bottom_nav_bar.dart';
import 'package:yoliday_llp/screens/home_screen.dart';
import 'package:yoliday_llp/screens/input_screen.dart';
import 'package:yoliday_llp/screens/portfolio_screen.dart';
import 'package:yoliday_llp/screens/profile_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Yoliday LLP',
        theme: ThemeData(
          // colorScheme: pri,
          fontFamily: 'roboto_regular',
        ),
        routes: {
          '/BottomNavBar': (context) => BottomNavBar(),
          '/Portfolio': (context) => PortfolioScreen(),
          '/HomeScreen': (context) => HomeScreen(),
          '/InputScreen': (context) => InputScreen(),
          '/ProfileScreen': (context) => ProfileScreen(),
        },
        initialRoute: '/BottomNavBar',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
