import 'package:flutter/material.dart';
import 'package:flutter_practice/model/post.dart';
import 'package:provider/provider.dart';
import 'package:flutter_practice/route/routes.dart';
import 'package:flutter_practice/pages/home/home_vm.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel viewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getPhotos();
    viewModel.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => viewModel,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _banner(),
                _listView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _banner() {
    return Consumer<HomeViewModel>(builder: (context, vm, child) {
      return SizedBox(
        width: double.infinity,
        height: 250.h,
        child: Swiper(
          indicatorLayout: PageIndicatorLayout.NONE,
          autoplay: true,
          pagination: const SwiperPagination(),
          control: const SwiperControl(),
          itemCount: vm.photoList.length,
          itemBuilder: (context, index) {
            return Container(
              height: 250.h,
              child: Image.network(
                vm.photoList[index].url ?? "",
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      );
    });
  }

  Widget _listView() {
    return Consumer<HomeViewModel>(builder: (context, vm, child) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: vm.postList.length,
        itemBuilder: (context, index) {
          return _listItemView(vm.postList[index]);
        },
      );
    });
  }

  Widget _listItemView(Post post) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutePath.webViewPage,
          arguments: {'title': post.title},
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
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      post.title ?? '',
                      style: const TextStyle(fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/images/star.png',
                  width: 30.r,
                  height: 30.r,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: SizedBox(
                width: double.infinity,
                child: Text(post.body ?? ''),
              ),
            )
          ],
        ),
      ),
    );
  }
}
