import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/projects_provider.dart';
import '../widgets/project_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProjectsProvider>(context, listen: false).fetchAndSetProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insurance Projects'),
      ),
      body: Column(children: [
        Consumer<ProjectsProvider>(builder: (context, projectsData, child) {
          return projectsData.projects.isEmpty
              ? Center(child: Text("No Projects Added"))
              : ListView.builder(
                  itemCount: projectsData.projects.length,
                  itemBuilder: (ctx, i) =>
                      ProjectItem(projectsData.projects[i]));
        }),
        ElevatedButton(
            onPressed: () => Navigator.of(context).pushNamed('/new_project'),
            child: const Text('Add Project'))
      ]),
    );
  }
}
