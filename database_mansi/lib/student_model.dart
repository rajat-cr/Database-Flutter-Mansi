class StudentModel {
int? id;
String? name;
String? rollNo;

  StudentModel({this.id, this.name, this.rollNo});
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'rollNo': rollNo};
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(id: map['id'], name: map['name'], rollNo: map['rollNo']);
  }
   @override
  String toString() {
    // TODO: implement toString
    return "Name: $name, rollNo: $rollNo";
  }
}
