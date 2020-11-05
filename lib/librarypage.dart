import 'package:flutter/material.dart';
import 'package:sociotest/getimages.dart';
import 'package:sociotest/main.dart';
import 'images.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

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
                  return Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop(hit.largeImageUrl);
                        scaffoldKey.currentState.showSnackBar(new SnackBar(
                            content: new Text("Wallpaper Changed")));
                      },
                      child: Image.network(hit.largeImageUrl),
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
// Image.network(
// '${data['hits'][index]['largeImageURL']}'),
