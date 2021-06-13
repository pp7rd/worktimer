import 'package:flutter/widgets.dart';

import '../model/project.dart';

// SQLite
import 'package:path/path.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class ProjectsVM {
  List<Project> _projects;
  Project _selectedProject;
  Database _projectdb;


  // Constructor
  ProjectsVM() {
    // Load projets from DB
    // For now just init an empty list
    init();
  }

  void init() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Init ffi loader if needed.
    sqfliteFfiInit();

    var databaseFactory = databaseFactoryFfi;

    _projectdb = await databaseFactory.openDatabase(
      join(
        await databaseFactory.getDatabasesPath(), 
        'project_database.db'
      )
    );

    var _projectTable = await _projectdb.query("Project");

    if (_projectTable == null)
    {
      await _projectdb.execute('''
        CREATE TABLE Project(
          id INTEGER PRIMARY KEY, 
          name TEXT, 
          duration NUMERIC
        )'''
      );
    }

    await _projectdb.query(table)
  /*
    _projects = [
      new Project('Project A'),
      new Project('Project B'),
      new Project('Project C'),
      new Project('Project D'),
    ];
*/
    // Assign default value
    _selectedProject = _projects.first;
  }

  // Define a function that inserts dogs into the database
  Future<void> insertDog(Dog dog) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Project>> getProjects() async {
    final List<Map<String, dynamic>> projects = await _projectdb.query("Project");
    
    return List.generate(projects.length, (i) {
      return Project(
        projects[i]['id'],
        projects[i]['name'],
        projects[i]['duration']
      );
    });
  }

  List<String> getProjectNames() {
    return _projects.map((project) => project.name).toList();
  }

  int selectProject(String projectname) {
    for (Project p in _projects) {
      if (p.name.compareTo(projectname) == 0) {
        _selectedProject = p;
        return 0;
      }
    }

    // -1 if no project found
    return -1;
  }

  Project getSelectedProject() {
    return _selectedProject;
  }
}
