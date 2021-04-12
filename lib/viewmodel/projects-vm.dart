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
  }

  List<Project> getProjects() {
    return projects;
  }

  List<String> getProjectNames() {
    return projects.map((project) => project.name).toList();
  }

  void selectProject(Project project) {
    selectedProject = project;
  }

  Project getSelectedProject() {
    return selectedProject;
  }
}
