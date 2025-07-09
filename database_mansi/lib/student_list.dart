import 'package:database_mansi/student_dao.dart';
import 'package:database_mansi/student_model.dart';
import 'package:flutter/material.dart';


class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  var studentController = TextEditingController();
  var studentRoll = TextEditingController();

  List<StudentModel> studentList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("IniState Function");
    setState(() {});
    getList();
  }

  void getList() async {
    studentList = await StudentDao().getStudent();
    setState(() {});
    print("StudentModel: $studentList");
    for (int i = 0; i < studentList.length; i++) {
      print("studentList ${studentList[i]}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Screen"),
        backgroundColor: Colors.amberAccent,
      ),
      body: ListView.builder(
        itemCount: studentList.length,
        itemBuilder: (BuildContext context, index) {
          return Card(
            color: Colors.blueAccent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name: ${studentList[index].name}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Roll No.: ${studentList[index].rollNo}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Add Student"),
                      SizedBox(height: 10),
                      TextField(
                        controller: studentController,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Enter Student Name",
                          label: Text("Enter Student Name"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: studentRoll,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: "Enter Student Name",
                          label: Text("Enter Student Name"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () async {
                          if (studentController.text.toString().isEmpty) {
                            print("Enter Name");
                          } else if (studentRoll.text.toString().isEmpty) {
                            print("Enter ROll NO");
                          } else {
                            var student_model = StudentModel(
                              name: studentController.text.toString(),
                              rollNo: studentRoll.text.toString(),
                            );
                            setState(() {});
                            await StudentDao().insertStudent(student_model);
                            getList();
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text("Save"),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
