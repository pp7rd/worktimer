// This project
import '../model/worktime.dart';
import '../model/project.dart';

class WorktimeVM {
  Worktime worktime;

  // Constructor
  WorktimeVM() {
    worktime = new Worktime();
    worktime.stopwatch = new Stopwatch();
  }

  Duration getTotalDuration() {
    return worktime.duration;
  }

  Duration getProjectDuration(Project project) {
    for (Project p in worktime.projects) {
      if (project.name == p.name) {
        return p.duration;
      }
    }

    // if no project found
    return null;
  }

  // Controlling stopwatch
  void startStopwatch() {
    worktime.stopwatch.start();
  }

  void pauseStopwatch() {
    if (worktime.stopwatch.isRunning) {
      worktime.stopwatch.stop();
    }
  }

  void stopStopwatch() {
    if (worktime.stopwatch.isRunning) {
      worktime.stopwatch.stop();
    }

    worktime.stopwatch.reset();
  }
}
