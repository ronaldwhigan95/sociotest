import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sociotest/main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectImg = 'https://wallpapercave.com/wp/wp3788126.jpg';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context); // Current config of a `window`
    final size = mediaQuery.size; // Current size of the `window`

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text('TAPP'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black38,
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: new BorderRadius.circular(50.0)),
                        height: 50,
                        child: Image.network(
                            "https://sociosoftware.com/Theme/img/website/sociosoftware.png"),
                      ),
                      Container(
                        child: Text(
                          "Header",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
              onTap: () {
                Navigator.of(scaffoldKey.currentState.context).pop();
                scaffoldKey.currentState
                    .showSnackBar(new SnackBar(content: new Text("Messages")));
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                Navigator.of(scaffoldKey.currentState.context).pop();
                scaffoldKey.currentState
                    .showSnackBar(new SnackBar(content: new Text("Profile")));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.of(scaffoldKey.currentState.context).pop();
                scaffoldKey.currentState
                    .showSnackBar(new SnackBar(content: new Text("Settings")));
              },
            ),
          ],
        ),
      ),
      body: CachedNetworkImage(
        imageUrl: selectImg,
        fit: BoxFit.fitHeight,
        width: size.width,
        height: size.height,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final selectedImageUrl =
              await Navigator.pushNamed<String>(context, '/library');
          setState(() {
            selectImg = selectedImageUrl;
          });
        },
        child: Icon(Icons.image),
      ),
    );
  }
}
