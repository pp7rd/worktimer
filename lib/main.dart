import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

// This project
import 'package:worktimer/styles/sizes.dart';

void main() {
  runApp(MyApp());
}

String formatTime(int milliseconds) {
  var secs = milliseconds ~/ 1000;
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  //var seconds = (secs % 60).toString().padLeft(2, '0');

  return "$hours:$minutes";
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
  Stopwatch _stopwatch;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _timer = new Timer.periodic(new Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  _startStopwatch() {
    _stopwatch.start();
  }

  _pauseStopwatch() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
    }
  }

  _stopStopwatch() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
    }

    _stopwatch.reset();
  }

  // Play icon
  Widget playButton(BuildContext context) => IconButton(
        icon: Icon(Icons.play_arrow_rounded),
        color: Colors.grey.shade800,
        onPressed: _startStopwatch,
        iconSize: 0.075 * height(context),
      );

  // Pause icon
  Widget pauseButton(BuildContext context) => IconButton(
        icon: Icon(Icons.pause_rounded),
        color: Colors.grey.shade800,
        onPressed: _pauseStopwatch,
        iconSize: 0.075 * height(context),
      );

  // Stop icon
  Widget stopButton(BuildContext context) => IconButton(
        icon: Icon(Icons.stop_rounded),
        color: Colors.grey.shade800,
        onPressed: _stopStopwatch,
        iconSize: 0.075 * height(context),
      );

  // Tabs
  Widget _nav(BuildContext context) => Container(
        height: 0.1 * height(context),
        //decoration: new BoxDecoration(
        //  color: Colors.grey.shade200,
        //),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Timer    "),
            Text("Projects    "),
            Text("History")
          ],
        ),
      );

  // Time
  Widget _time(BuildContext context) => Container(
        height: 0.3 * height(context),
        //decoration: new BoxDecoration(
        //  color: Colors.grey.shade100,
        //),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                SizedBox(height: 0.15 * height(context), width: width(context)),
                Text(
                  formatTime(_stopwatch.elapsedMilliseconds),
                  style: Theme.of(context).textTheme.headline1.merge(TextStyle(
                        letterSpacing: 0.1,
                        fontSize: 0.1 * height(context),
                      )),
                ),
              ],
            ),
          ],
        ),
      );

  String dropdownValue = 'Project A';

  // Projects
  Widget _projects(BuildContext context) => Container(
      height: 0.45 * height(context),
      //decoration: new BoxDecoration(
      //  color: Colors.grey.shade300,
      //),
      alignment: Alignment.topCenter,
      child: Row(
        children: <Widget>[
          SizedBox(
              width: 0.3 * width(context), height: 0.055 * height(context)),
          Container(
              height: 0.055 * height(context),
              width: 0.4 * width(context),
              color: Colors.grey.shade900,
              alignment: Alignment.center,
              child: DropdownButton(
                value: dropdownValue,
                dropdownColor: Colors.grey.shade700,
                style: const TextStyle(color: Colors.white, fontSize: 18),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                iconEnabledColor: Colors.grey.shade500,
                underline: Container(
                  height: 2,
                  color: Colors.grey.shade900,
                ),
                items: <String>['Project A', 'Project B', 'Project C']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
        ],
      ));

  // Buttons
  Widget _buttons(BuildContext context) => Container(
        height: 0.15 * height(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            playButton(context),
            pauseButton(context),
            stopButton(context),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _nav(context),
            _time(context),
            _projects(context),
            _buttons(context),
          ],
        ),
      ),
    );
  }
}
