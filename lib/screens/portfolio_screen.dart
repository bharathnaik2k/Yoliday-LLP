import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoliday_llp/const/app_colors.dart';
import 'package:yoliday_llp/widgets/project_card.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  PortfolioScreenState createState() => PortfolioScreenState();
}

class PortfolioScreenState extends State<PortfolioScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    finalhData = data;
    // setState(() {});
  }

  List<Map<String, dynamic>> data = [
    {
      'title': 'Kempuram loction How To hello',
      'img':
          'https://images.unsplash.com/photo-1434030216411-0b793f4b4173?w=150&h=100&fit=crop'
    },
    {
      'title': 'Booking for bookings for for for',
      'img':
          'https://images.unsplash.com/photo-1629904853893-c2c8981a1dc5?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZGV2ZWxvcGVyfGVufDB8fDB8fHww'
    },
    {
      'title': 'Indian Indian Indian for taht sdjsd',
      'img':
          'https://images.unsplash.com/photo-1587620962725-abab7fe55159?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZGV2ZWxvcGVyfGVufDB8fDB8fHww'
    },
    {
      'title': 'hello everyone hello hello sfdd',
      'img':
          'https://images.unsplash.com/photo-1580894908361-967195033215?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c29mdHdhcmUlMjBlbmdpbmVlcnxlbnwwfHwwfHx8MA%3D%3D'
    },
    {
      'title': 'Check Check for here the end',
      'img':
          'https://images.unsplash.com/photo-1551434678-e076c223a692?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHNvZnR3YXJlJTIwZGV2ZWxvcGVyfGVufDB8fDB8fHww'
    },
    {
      'title': 'Kempuram loction How To hello',
      'img':
          'https://images.unsplash.com/photo-1434030216411-0b793f4b4173?w=150&h=100&fit=crop'
    }
  ];
  List<Map<String, dynamic>> finalhData = [];

  void searchFun(String keyword) {
    List<Map<String, dynamic>> searchData = [];
    if (keyword.isEmpty) {
      searchData = data;
    } else {
      searchData = data
          .where((user) =>
              user['title'].toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
    setState(() {
      finalhData = searchData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.whiteColor,
          child: TabBar(
            controller: _tabController,
            labelColor: AppColors.baseColor,
            unselectedLabelColor: AppColors.greyColor.withAlpha(1000),
            indicatorColor: AppColors.baseColor,
            dragStartBehavior: DragStartBehavior.down,
            tabAlignment: TabAlignment.center,
            textScaler: TextScaler.noScaling,
            labelStyle: TextStyle(fontSize: 14.sp),
            isScrollable: true,
            padding: EdgeInsets.zero,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.zero,
            unselectedLabelStyle: TextStyle(fontSize: 14.sp),
            tabs: [
              Tab(text: 'Project'),
              Tab(text: 'Saved'),
              Tab(text: 'Shared'),
              Tab(text: 'Achievement'),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          color: AppColors.whiteColor,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              onChanged: (value) => searchFun(value),
              decoration: InputDecoration(
                hintText: 'Search a project',
                hintStyle: TextStyle(color: AppColors.greyColor.withAlpha(100)),
                suffixIcon: Container(
                  padding: EdgeInsets.all(5.sp),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.baseColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.search,
                    color: AppColors.whiteColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 14, horizontal: 14),
              ),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                itemCount: finalhData.length,
                itemBuilder: (context, index) {
                  return cards(
                    finalhData[index]['title'] ?? 'N/A',
                    finalhData[index]['img'] ?? 'https://picsum.photos/200',
                  );
                },
              ),
              Center(child: Text('Saved')),
              Center(child: Text('Shared')),
              Center(child: Text('Achievement')),
            ],
          ),
        ),
      ],
    );
  }

  ProjectCard cards(String title, String imageUrl) {
    return ProjectCard(
      imageUrl: imageUrl,
      title: title,
      subject: 'BAHASA SUNDA',
      author: 'Oleh Al-Baiqi Samaan',
      grade: 'A',
    );
  }
}
