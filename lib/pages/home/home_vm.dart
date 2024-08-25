import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/http/dio_instance.dart';
import 'package:flutter_practice/model/photo.dart';
import 'package:flutter_practice/model/post.dart';

class HomeViewModel with ChangeNotifier {
  List<Photo> photoList = [];
  List<Post> postList = [];

  Future getPhotos() async {
    Response response = await DioInstance.instance().get('photos');

    photoList = [];

    if (response.statusCode == 200) {
      PhotoCollection photoCollection = PhotoCollection.fromJson(response.data);
      for (int i = 0; i < 4; i++) {
        photoList.add(photoCollection.data[i]);
      }
    }

    notifyListeners();
  }

  Future getPosts() async {
    Response response = await DioInstance.instance().get('posts');

    postList = [];

    if (response.statusCode == 200) {
      PostCollection postCollection = PostCollection.fromJson(response.data);
      for (int i = 0; i < 10; i++) {
        postList.add(postCollection.data[i]);
      }
    }

    notifyListeners();
  }
}
