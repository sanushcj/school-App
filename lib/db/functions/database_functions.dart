// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:ghss_periya/db/model/data_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ghss_periya/screens/Admin/add_students.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

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
  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
}

getallstudents() async {
  final studentDataBase = await Hive.openBox<StudentModel>('studentDB');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDataBase.values);
  studentListNotifier.notifyListeners();
}

deleteStudent(int key) async {
  final studentDataBase = await Hive.openBox<StudentModel>('studentDB');
  await studentDataBase.delete(key);
  getallstudents();
}

editstudent() async {
  final studentDataBase = await Hive.openBox<StudentModel>('studentDB');
}
