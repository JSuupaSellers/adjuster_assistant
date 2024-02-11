import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/project.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    // Get the device's documents directory to store the database
    final documentsDirectory = await getDatabasesPath();
    final path = join(documentsDirectory,
        'insurance_projects.db'); // Name of your database file

    // Open the database (creates if it doesn't exist)
    return openDatabase(
      path,
      version: 1, // Change this on schema updates
      onCreate: (Database db, int version) async {
        // Create project table
        await db.execute('''
          CREATE TABLE projects (
            id TEXT PRIMARY KEY,           
            title TEXT NOT NULL,            
            client TEXT NOT NULL,          
            dateCreated TEXT NOT NULL,     
            address TEXT           
          );
        ''');

        // Create transcriptions table
        await db.execute('''
          CREATE TABLE transcriptions (
            id TEXT PRIMARY KEY, 
            projectId TEXT NOT NULL,                
            text TEXT NOT NULL,            
            timestamp TEXT NOT NULL,        
            FOREIGN KEY (projectId) REFERENCES projects(id) 
          );
        ''');
      },
    );
  }

  Future<void> addProject(Project project) async {
    final db = await database;
    await db.insert(
      'projects',
      project.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Project>> getProjects() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('projects');
    return List.generate(maps.length, (i) {
      return Project(
        id: maps[i]['id'],
        title: maps[i]['title'],
        client: maps[i]['client'],
        dateCreated: DateTime.parse(maps[i]['dateCreated']),
        address: maps[i]['address'],
      );
    });
  }
}
