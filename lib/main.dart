import 'package:flutter/material.dart';
import 'package:flutter_practice/http/dio_instance.dart';
import 'package:flutter_practice/route/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

void main() {
  DioInstance.instance()
      .initDio(baseUrl: 'https://jsonplaceholder.typicode.com/');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: ScreenUtilInit(
        designSize: const Size(360, 960),
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            initialRoute: RoutePath.home,
            onGenerateRoute: Routes.generateRoute,
          );
        },
      ),
    );
  }
}
