import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

// This project
import 'package:worktimer/styles/sizes.dart';
import './pages/timer/timer.dart';
import './pages/projects/project.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        fontFamily: 'Georgia',
        textTheme: TextTheme(
          headline1: TextStyle(fontFamily: GoogleFonts.ptMono().fontFamily),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(
              fontSize: 14.0,
              fontFamily: GoogleFonts.courierPrime().toString()),
        ),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _tabController(BuildContext context) => DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey.shade50,
            elevation: 0,
            flexibleSpace: new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                new TabBar(
                  indicatorColor: Colors.grey.shade600,
                  labelColor: Colors.grey.shade800,
                  tabs: [
                    new Tab(text: 'Timer'),
                    new Tab(text: 'Projects'),
                    new Tab(text: 'History'),
                  ],
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              TimerPage(),
              ProjectPage(),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return _tabController(context);
  }
}
