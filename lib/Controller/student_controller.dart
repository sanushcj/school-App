import 'package:get/get.dart';
import 'package:ghss_periya/db/model/data_model.dart';
import 'package:hive/hive.dart';

class StudentController extends GetxController {

var studentListUpdate = <StudentModel>[].obs;


void addStudent(StudentModel value) async {
  final studentDataBase = await Hive.openBox<StudentModel>('studentDB');
  final _id = await studentDataBase.add(value);

  value.id = _id;
  final _student = StudentModel(
      id: _id,
      name: value.name,
      age: value.age,
      standard: value.standard,
      address: value.address,
      program: value.program,
      imgofstudent: value.imgofstudent);

  studentDataBase.put(_id, _student);
  studentListUpdate.add(value);
}

getallstudents() async {
  final studentDataBase = await Hive.openBox<StudentModel>('studentDB');
  studentListUpdate.clear();
  studentListUpdate.addAll(studentDataBase.values);
}

deleteStudent(int key) async {
  final studentDataBase = await Hive.openBox<StudentModel>('studentDB');
  await studentDataBase.delete(key);
  getallstudents();
}

editstudent() async {
  final studentDataBase = await Hive.openBox<StudentModel>('studentDB');
}


  
}