import 'package:flutter/material.dart';
import 'package:sociotest/getimages.dart';
import 'package:sociotest/db/database_helper.dart';

//import 'package:cached_network_image/cached_network_image.dart';
//import 'package:path_provider/path_provider.dart';
//import 'package:flutter/src/painting/_network_image_io.dart';
//import 'package:sociotest/homepage.dart';

import 'images.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

final dbHelper = DatabaseHelper.instance;

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Library"),
      ),
      body: new FutureBuilder<Images>(
        future: getImages(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            print(snapShot.hasError);
            return Text(
              'Failed to get response from Server',
            );
          } else if (snapShot.hasData) {
            final hits = snapShot.data.hits;
            return new Center(
              child: new ListView.builder(
                itemCount: hits.length,
                itemBuilder: (context, index) {
                  final hit = hits[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pop(hit.largeImageUrl);
                      _insert(hit);
                    },
                    child: Image.network(hit.largeImageUrl),
                  );
                },
              ),
            );
          } else if (!snapShot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

void _insert(Hit hit) async {
  // row to insert
  Map<String, dynamic> row = {
    DatabaseHelper.columnDate: DateTime.now().toUtc().millisecondsSinceEpoch,
    DatabaseHelper.columnUrl: hit.largeImageUrl,
  };
  final id = await dbHelper.insert(row);
  print('inserted row id: $id');
  print(row);
}
