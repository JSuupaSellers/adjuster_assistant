import 'package:flutter/material.dart';
import '../models/project.dart';

class ProjectItem extends StatelessWidget {
  final Project project;

  ProjectItem(this.project);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(project.title),
      subtitle: Text(project.client),
      trailing: IconButton(
        icon: const Icon(Icons.more_vert),
        onPressed: () {
          // Show a bottom sheet with project details
        },
      ),
    );
  }
}
