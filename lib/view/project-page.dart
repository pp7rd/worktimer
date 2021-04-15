// This project
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worktimer/styles/sizes.dart';
import 'package:worktimer/viewmodel/projects-vm.dart';
import '../model/project.dart';

Widget _projectCard(BuildContext context, Project project) {
  var w = 0.85 * width(context);
  var h = 0.2 * width(context);

  return Container(
      width: w,
      height: h,
      child: Card(
          child: InkWell(
              onTap: () {
                print('Card tapped.');
              },
              child: Row(
                children: [
                  Container(
                    width: 0.1 * w,
                    height: h,
                  ),
                  Container(
                    width: 0.9 * w,
                    height: h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 0.5 * h,
                          alignment: Alignment.centerLeft,
                          child: Text(project.name,
                              style:
                                  Theme.of(context).textTheme.headline3.merge(
                                        TextStyle(
                                            letterSpacing: 0.1,
                                            fontSize: 0.3 * h),
                                      )),
                        ),
                        Container(
                          height: 0.3 * h,
                          child: Text('1h 23m spent'),
                        )
                      ],
                    ),
                  )
                ],
              ))));
}

Widget _projectList(BuildContext context, List<Project> projects) => Container(
      //color: Colors.green.shade100,
      width: 0.95 * width(context),
      height: 0.85 * height(context),
      child: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return _projectCard(context, projects[index]);
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
