import 'package:flutter/material.dart';
import 'package:flutter_practice/repository/api.dart';
import 'package:flutter_practice/repository/model/photo.dart';
import 'package:flutter_practice/repository/model/post.dart';

class HomeViewModel with ChangeNotifier {
  List<Photo> photoList = [];
  List<Post> originalPostList = [];
  List<Post> postList = [];
  int totalPosts = 10;

  Future getPhotos() async {
    List<Photo> data = await Api.instance.getPhotos();
    photoList = data.getRange(0, 4).toList();
    notifyListeners();
  }

  Future getPosts(bool isMorePosts) async {
    if (originalPostList.isEmpty) {
      originalPostList = await Api.instance.getPosts();
    }
    if (isMorePosts) {
      totalPosts += 10;
    } else {
      totalPosts = 10;
    }
    postList = originalPostList.getRange(0, totalPosts).toList();
    notifyListeners();
  }
}
