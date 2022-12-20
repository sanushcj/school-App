// import 'dart:html';

//  RxList<StudentModel> studentListNotifier = ([]);

// void addStudent(StudentModel value) async {
//   final studentDataBase = await Hive.openBox<StudentModel>('studentDB');
//   final _id = await studentDataBase.add(value);

//   value.id = _id;
//   final _student = StudentModel(
//       id: _id,
//       name: value.name,
//       age: value.age,
//       standard: value.standard,
//       address: value.address,
//       program: value.program,
//       imgofstudent: value.imgofstudent);

//   studentDataBase.put(_id, _student);
//   studentListNotifier.add(value);
// }

// getallstudents() async {
//   final studentDataBase = await Hive.openBox<StudentModel>('studentDB');
//   studentListNotifier.clear();
//   studentListNotifier.addAll(studentDataBase.values);
// }

// deleteStudent(int key) async {
//   final studentDataBase = await Hive.openBox<StudentModel>('studentDB');
//   await studentDataBase.delete(key);
//   getallstudents();
// }

// editstudent() async {
//   final studentDataBase = await Hive.openBox<StudentModel>('studentDB');
// }
