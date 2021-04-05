// This project
import 'package:flutter/material.dart';
import 'package:worktimer/styles/sizes.dart';
/*
Widget _projectList(BuildContext context) => ListView(
      children: const <Widget>[
        //Card(
        //  child: ListTile(
        //    //leading: FlutterLogo(size: 56.0),
        //    title: Text('Two-line ListTile'),
        //    subtitle: Text('Here is a second line'),
        //    trailing: Icon(Icons.more_vert),
        //  ),
        //),
        Text('This is a test'),
      ],
    );
*/

// Play icon
Widget moreButton(BuildContext context) => IconButton(
      icon: Icon(Icons.more_vert),
      color: Colors.grey.shade800,
    );

Widget _projectList(BuildContext context) => Container(
      //color: Colors.green.shade100,
      width: 0.95 * width(context),
      height: 0.85 * height(context),
      child: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text('This is Card A'),
              subtitle: Text('This is subtitle for Card A'),
              trailing: moreButton(context),
            ),
          ),
        ],
      ),
    );

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPage createState() => _ProjectPage();
}

class _ProjectPage extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 0.01 * height(context),
            ),
            _projectList(context),
          ],
        ),
      ),
    );
  }
}
