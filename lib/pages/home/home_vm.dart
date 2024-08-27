import 'package:flutter/material.dart';
import 'package:flutter_practice/repository/api.dart';
import 'package:flutter_practice/repository/model/photo.dart';
import 'package:flutter_practice/repository/model/post.dart';

class HomeViewModel with ChangeNotifier {
  List<Photo> photoList = [];
  List<Post> postList = [];

  Future getPhotos() async {
    List<Photo> data = await Api.instance.getPhotos();
    photoList = data.getRange(0, 4).toList();
    notifyListeners();
  }

  Future getPosts() async {
    List<Post> data = await Api.instance.getPosts();
    postList = data.getRange(0, 10).toList();
    notifyListeners();
  }
}
