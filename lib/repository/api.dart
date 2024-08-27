import 'package:dio/dio.dart';
import 'package:flutter_practice/http/dio_instance.dart';
import 'package:flutter_practice/repository/model/photo.dart';
import 'package:flutter_practice/repository/model/post.dart';

class Api {
  static Api instance = Api._();

  Api._();

  Future<List<Photo>> getPhotos() async {
    Response response = await DioInstance.instance().get('photos');
    return PhotoCollection.fromJson(response.data).data;
  }

  Future<List<Post>> getPosts() async {
    Response response = await DioInstance.instance().get('posts');
    return PostCollection.fromJson(response.data).data;
  }
}
