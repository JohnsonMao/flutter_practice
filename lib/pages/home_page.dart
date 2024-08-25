import 'package:flutter/material.dart';
import 'package:flutter_practice/model/photo.dart';
import 'package:flutter_practice/route/routes.dart';
import 'package:flutter_practice/service/service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Photo> bannerList = [];

  @override
  void initState() {
    super.initState();
    initBannerData();
  }

  void initBannerData() async {
    bannerList = await Service.getPhotos();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _banner(),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 50,
                itemBuilder: (context, index) {
                  return _listItemView('小貓咪${index + 1}');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _banner() {
    return SizedBox(
      width: double.infinity,
      height: 250.h,
      child: Swiper(
        indicatorLayout: PageIndicatorLayout.NONE,
        autoplay: true,
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
        itemCount: bannerList.length,
        itemBuilder: (context, index) {
          return Container(
            height: 250.h,
            child: Image.network(
              bannerList[index].url ?? "",
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  Widget _listItemView(String title) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutePath.webViewPage,
          arguments: {'title': title},
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 5.h, bottom: 5.h, left: 10.w, right: 10.w),
        padding:
            EdgeInsets.only(top: 5.h, bottom: 5.h, left: 10.w, right: 10.w),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 0.5.r),
          borderRadius: BorderRadius.all(Radius.circular(6.r)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.network(
                    'https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg',
                    width: 40.r,
                    height: 40.r,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Image.asset(
                  'assets/images/star.png',
                  width: 30.r,
                  height: 30.r,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: const Text(
                '貓咪是一種迷人又有趣的生物，雖然他們的體型跟外表不像狗狗一樣多變，但多變的花色及逗趣的行為依然讓我們為之著迷，不管是特色鮮明的品種貓，還是最多人飼養的米克斯，只要你喜歡就通通是好貓。',
              ),
            )
          ],
        ),
      ),
    );
  }
}
