// This project
import 'package:flutter/material.dart';
import 'package:worktimer/styles/sizes.dart';
import 'package:worktimer/viewmodel/projects-vm.dart';
import '../model/project.dart';

// Play icon
Widget moreButton(BuildContext context) => IconButton(
      icon: Icon(Icons.more_vert),
      color: Colors.grey.shade800,
    );

Widget _projectList(BuildContext context, List<Project> projects) => Container(
      //color: Colors.green.shade100,
      width: 0.95 * width(context),
      height: 0.85 * height(context),
      child: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${projects[index].name}'),
          );
        },
      ),
    );

class ProjectPage extends StatefulWidget {
  ProjectsVM projectsVM;

  // Constructor
  ProjectPage(this.projectsVM);

  @override
  _ProjectPage createState() => _ProjectPage(projectsVM);
}

class _ProjectPage extends State<ProjectPage> {
  ProjectsVM _projectsVM;
  List<Project> _projects;

  // Constructor
  _ProjectPage(this._projectsVM);

  @override
  void initState() {
    super.initState();

    _projects = _projectsVM.projects;
  }

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
            _projectList(context, _projects),
          ],
        ),
      ),
    );
  }
}
