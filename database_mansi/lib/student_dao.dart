import 'package:database_mansi/database_provider.dart';
import 'package:database_mansi/student_model.dart';
import 'package:sqflite/sqflite.dart';

class StudentDao {
  Future<void> insertStudent(StudentModel studentModel) async {
    var db = await DatabaseProvider().db;
    await db!.insert(
      "StudentModel",
      studentModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  Future<List<StudentModel>> getStudent() async {
    var db = await DatabaseProvider().db;
    final List<Map<String, dynamic>> maps = await db!.query("StudentModel");
    return List.generate(maps.length, (i) {
      return StudentModel.fromMap(maps[i]);
    });
  }
}
