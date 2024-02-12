import 'package:adjuster_assistant/providers/projects_provider.dart';
import 'package:adjuster_assistant/screens/home_screen.dart';
import 'package:adjuster_assistant/screens/new_project_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/RecordingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProjectsProvider(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/new_project': (context) => NewProjectScreen(),
        },
        title: 'Insurance Adjuster App', // Your app title
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
