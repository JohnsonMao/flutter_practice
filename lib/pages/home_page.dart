import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 250.h,
            child: Swiper(
                indicatorLayout: PageIndicatorLayout.NONE,
                autoplay: true,
                pagination: const SwiperPagination(),
                control: const SwiperControl(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    height: 250.h,
                    color: [
                      Colors.pink,
                      Colors.lightGreen,
                      Colors.lightBlue
                    ][index],
                  );
                }),
          )
        ],
      )),
    );
  }
}
