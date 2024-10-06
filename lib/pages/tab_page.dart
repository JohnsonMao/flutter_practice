import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/home/home_page.dart';
import 'package:flutter_practice/pages/other/other_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<StatefulWidget> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int currentIndex = 0;

  final List<Widget> pages = const [HomePage(), OtherPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: pages,
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          selectedLabelStyle: TextStyle(fontSize: 13.sp),
          currentIndex: currentIndex,
          items: _barItemList(),
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _barItemList() {
    return [
      BottomNavigationBarItem(
        label: '首頁',
        icon: Image.asset(
          'assets/images/star.png',
          width: 32.r,
          height: 32.r,
        ),
      ),
      BottomNavigationBarItem(
        label: '其他',
        icon: Image.asset(
          'assets/images/star.png',
          width: 32.r,
          height: 32.r,
        ),
      ),
    ];
  }
}
