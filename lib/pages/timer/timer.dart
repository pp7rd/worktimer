import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// This project
import '../../styles/sizes.dart';

String formatTime(int milliseconds) {
  var secs = milliseconds ~/ 1000;
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  var seconds = (secs % 60).toString().padLeft(2, '0');

  return "$minutes:$seconds";
}

class TimerPage extends StatefulWidget {
  @override
  _TimerPage createState() => _TimerPage();
}

class _TimerPage extends State<TimerPage> {
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
            _time(context),
            _projects(context),
            _buttons(context),
          ],
        ),
      ),
    );
  }
}
