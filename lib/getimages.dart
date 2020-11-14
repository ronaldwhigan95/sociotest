import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'images.dart';

var urltoCache;

Future<Images> getImages() async {
  String url =
      'https://pixabay.com/api/?key=18965333-6bce76939e1bfa8f08948f257&q=*&image_type=photo';
  http.Response resp = await http.get(url);
  final images = Images.fromJson(json.decode(resp.body));

  return images;
}

Future<Images> getImagesDC() async {
  String url =
      'https://pixabay.com/api/?key=18965333-6bce76939e1bfa8f08948f257&q=dogs&image_type=photo';
  http.Response resp = await http.get(url);
  final images = Images.fromJson(json.decode(resp.body));

  return images;
}

Future<Images> getImagesBC() async {
  String url =
      'https://pixabay.com/api/?key=18965333-6bce76939e1bfa8f08948f257&q=business&image_type=photo';
  http.Response resp = await http.get(url);
  final images = Images.fromJson(json.decode(resp.body));

  return images;
}

Future<Images> getImagesRC() async {
  String url =
      'https://pixabay.com/api/?key=18965333-6bce76939e1bfa8f08948f257&q=reptiles&image_type=photo';
  http.Response resp = await http.get(url);
  final images = Images.fromJson(json.decode(resp.body));

  return images;
}

Future<Images> getImagesCatC() async {
  String url =
      'https://pixabay.com/api/?key=18965333-6bce76939e1bfa8f08948f257&q=cats&image_type=photo';
  http.Response resp = await http.get(url);
  final images = Images.fromJson(json.decode(resp.body));

  return images;
}

Future<Images> getImagesCompC() async {
  String url =
      'https://pixabay.com/api/?key=18965333-6bce76939e1bfa8f08948f257&q=computers&image_type=photo';
  http.Response resp = await http.get(url);
  final images = Images.fromJson(json.decode(resp.body));

  return images;
}
