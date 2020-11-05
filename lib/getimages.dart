import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import 'images.dart';

var urltoCache =
    'https://pixabay.com/[image_type]/sign-post-arrow-sign-direction-sign-5655110/';

Future<Images> getImages() async {
  String url =
      'https://pixabay.com/api/?key=18965333-6bce76939e1bfa8f08948f257&editors_choice=true&per_page=&orientation=vertical';
  http.Response resp = await http.get(url);
  final images = Images.fromJson(json.decode(resp.body));

  return images;
}
