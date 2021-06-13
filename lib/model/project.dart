import 'dart:core';

class Project {
  int id;
  String name;
  Duration duration = new Duration();

  // Constructor
  Project(
    this.id, 
    this.name, 
    this.duration
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'duration': duration,
    };
  }
}
