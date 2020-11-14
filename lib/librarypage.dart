import 'package:flutter/material.dart';
import 'package:sociotest/getimages.dart';
import 'package:sociotest/db/database_helper.dart';
import 'package:sociotest/main.dart';
import 'images.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

final dbHelper = DatabaseHelper.instance;
var selectedCategory = getImages();

class _LibraryPageState extends State<LibraryPage> {
  @override
  void initState() {
    super.initState();
    // _getCurrentlySelectedImg();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Library"),
      ),
      body: new FutureBuilder<Images>(
        future: selectedCategory,
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
                  return Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop(hit.largeImageUrl);
                        scaffoldKey.currentState.showSnackBar(new SnackBar(
                            duration: const Duration(seconds: 2),
                            content: new Text("Wallpaper Changed")));
                        _insert(hit);
                      },
                      child: Image.network(hit.previewUrl),
                    ),
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
    DatabaseHelper.columnUrl: hit.previewUrl,
  };
  final id = await dbHelper.insert(row);
  print('inserted row id: $id');
  print(row);
}
