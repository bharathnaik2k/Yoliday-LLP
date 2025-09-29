import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yoliday_llp/const/app_colors.dart';
import 'package:yoliday_llp/screens/home_screen.dart';
import 'package:yoliday_llp/screens/input_screen.dart';
import 'package:yoliday_llp/screens/portfolio_screen.dart';
import 'package:yoliday_llp/screens/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  int _selectedBottomIndex = 1;
  late PageController pageController = PageController();

  List<Widget> screens = [
    HomeScreen(),
    PortfolioScreen(),
    InputScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _selectedBottomIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _selectedBottomIndex == 1
            ? AppBar(
                backgroundColor: AppColors.backgroundColor,
                elevation: 0,
                title: Text(
                  'Portfolio',
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                actions: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/svg/bag.svg',
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: SvgPicture.asset('assets/svg/notifi.svg'),
                    onPressed: () {},
                  ),
                ],
              )
            : null,
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _selectedBottomIndex = index;
            });
          },
          controller: pageController,
          children: screens,
        ),
        floatingActionButton: _selectedBottomIndex == 1
            ? SizedBox(
                height: 35.h,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.filter_list,
                    size: 16.sp,
                    color: AppColors.whiteColor,
                  ),
                  label: Text(
                    'Filter',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.baseColor,
                    shape: StadiumBorder(),
                  ),
                ),
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 0.1,
                  blurRadius: 1,
                  color: Colors.grey,
                )
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: BottomNavigationBar(
              currentIndex: _selectedBottomIndex,
              onTap: (index) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.baseColor,
              unselectedItemColor: AppColors.greyColor,
              // iconSize: 20.sp,
              items: [
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      if (_selectedBottomIndex == 0)
                        Container(
                          height: 2,
                          width: 24,
                          color: AppColors.baseColor,
                        ),
                      SizedBox(height: 4),
                      SvgPicture.asset(
                        'assets/svg/home.svg',
                        height: 22.h,
                        width: 22.w,
                        color: _selectedBottomIndex == 0
                            ? AppColors.baseColor
                            : AppColors.greyColor,
                      ),
                    ],
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      if (_selectedBottomIndex == 1)
                        Container(
                          height: 2,
                          width: 24,
                          color: AppColors.baseColor,
                        ),
                      SizedBox(height: 4),
                      SvgPicture.asset(
                        height: 22.h,
                        width: 22.w,
                        'assets/svg/portfolio.svg',
                        color: _selectedBottomIndex == 1
                            ? AppColors.baseColor
                            : AppColors.greyColor,
                      ),
                    ],
                  ),
                  label: 'Portfolio',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      if (_selectedBottomIndex == 2)
                        Container(
                          height: 2,
                          width: 24,
                          color: AppColors.baseColor,
                        ),
                      SizedBox(height: 4),
                      SvgPicture.asset(
                        height: 22.h,
                        width: 22.w,
                        'assets/svg/input.svg',
                        color: _selectedBottomIndex == 2
                            ? AppColors.baseColor
                            : AppColors.greyColor,
                      ),
                    ],
                  ),
                  label: 'Input',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      if (_selectedBottomIndex == 3)
                        Container(
                          height: 2,
                          width: 24,
                          color: AppColors.baseColor,
                        ),
                      SizedBox(height: 4),
                      SvgPicture.asset(
                        height: 22.h,
                        width: 22.w,
                        'assets/svg/profile.svg',
                        color: _selectedBottomIndex == 3
                            ? AppColors.baseColor
                            : AppColors.greyColor,
                      ),
                    ],
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
