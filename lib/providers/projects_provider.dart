import '../models/project.dart';
import 'package:flutter/foundation.dart';
import '../services/database_helper.dart';

class ProjectsProvider with ChangeNotifier {
  List<Project> _projects = [];

  List<Project> get projects => _projects;

  Future<void> fetchAndSetProjects() async {
    _projects = await DatabaseHelper.instance.getProjects();
    notifyListeners();
  }

  Future<void> addProject(Project newProject) async {
    await DatabaseHelper.instance.addProject(newProject);
    _projects.add(newProject);
    notifyListeners();
  }
}
