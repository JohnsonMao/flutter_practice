import 'package:dio/dio.dart';
import 'package:flutter_practice/model/photo.dart';

class Service {
  static Future<List<Photo>> getPhotos() async {
    const String baseUrl = 'https://jsonplaceholder.typicode.com/';

    Dio dio = Dio();

    dio.options = BaseOptions(
      method: 'GET',
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    );

    Response response = await dio.get('photos');

    if (response.statusCode != 200) {
      return [];
    }

    PhotoCollection photoCollection = PhotoCollection.fromJson(response.data);
    List<Photo> photoList = [];
    for (int i = 0; i < 5; i++) {
      photoList.add(photoCollection.data[i]);
    }
    return photoList;
  }
}
