// ignore_for_file: no_leading_underscores_for_local_identifiers, must_be_immutable

import 'package:flutter/material.dart';
import 'package:ghss_periya/db/functions/database_functions.dart';
import 'package:ghss_periya/db/model/data_model.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class EditStudent extends StatelessWidget {
  int index;
  final nameedit = TextEditingController();
  final ageedit = TextEditingController();
  final addressedit = TextEditingController();
  final programedit = TextEditingController();
  final classnameedit = TextEditingController();

  EditStudent({
    required this.index,
    super.key,
  });

  String? pickedimagefromGallery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Screen',
        ),
        backgroundColor: const Color.fromARGB(255, 0, 51, 255),
      ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),

            TextFormField(
              // initialValue: editdata. ,
              controller: nameedit,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Student  Name',
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            TextFormField(
              // initialValue: age,
              controller: ageedit,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Student Age',
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              // initialValue: address,
              controller: addressedit,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Student Address',
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              // initialValue: classname,
              controller: classnameedit,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Class',
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              // initialValue: program,
              controller: programedit,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Program Intrested',
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            // STUDENT PHOTO BUTTON
            ElevatedButton.icon(
                onPressed: () {
                  imageFromGallery();
                },
                icon: const Icon(Icons.add_a_photo),
                label: const Text('Upload Student Photo')),
            // SUBMIT BUTTON
            ElevatedButton.icon(
              onPressed: () {
                updateFunction(context, index);
              },
              icon: const Icon(Icons.done_all_rounded),
              label: const Text('Update'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> imageFromGallery() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    pickedimagefromGallery = image!.path;
  }

  updateFunction(context, int index) async {
    final newName = nameedit.text;
    final newAge = ageedit.text;
    final newClass = classnameedit.text;
    final newprograme = programedit.text;
    final newaddress = addressedit.text;

    if (newName.isEmpty ||
        newAge.isEmpty ||
        newClass.isEmpty ||
        newprograme.isEmpty ||
        newaddress.isEmpty) {
      return;
    } else {
      final _updateStudent = StudentModel(
          name: newName,
          age: newAge,
          standard: newClass,
          address: newprograme,
          program: newaddress,
          imgofstudent: pickedimagefromGallery!);
      updateToHive(index, _updateStudent);    }
  }
}

updateToHive(int index, update) async {
  final studentDataBase = await Hive.openBox<StudentModel>('studentDB');
  studentDataBase.putAt(index, update);
  getallstudents();
}
