import '../model/project.dart';

class ProjectsVM {
  List<Project> projects;
  Project selectedProject;

  // Constructor
  ProjectsVM() {
    // Load projets from DB
    // For now just init an empty list
    init();
  }

  void init() {
    projects = [
      new Project('Project A'),
      new Project('Project B'),
      new Project('Project C'),
      new Project('Project D'),
    ];

    // Assign default value
    selectedProject = projects.first;
  }

  List<Project> getProjects() {
    return projects;
  }

  List<String> getProjectNames() {
    return projects.map((project) => project.name).toList();
  }

  int selectProject(String projectname) {
    for (Project p in projects) {
      if (p.name.compareTo(projectname) == 0) {
        selectedProject = p;
        return 0;
      }
    }

    // -1 if no project found
    return -1;
  }

  Project getSelectedProject() {
    return selectedProject;
  }
}
