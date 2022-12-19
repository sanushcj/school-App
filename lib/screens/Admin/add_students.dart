// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ghss_periya/db/functions/database_functions.dart';
import 'package:ghss_periya/db/model/data_model.dart';
// import 'package:ghss_periya/screens/students_registered.dart';
import 'package:ghss_periya/screens/successful.dart';
import 'package:image_picker/image_picker.dart';
  final _namecontroller = TextEditingController();
  final _agecontroller = TextEditingController();
  final _classController = TextEditingController();
  final _programController = TextEditingController();
  final _addressController = TextEditingController();

class Teacher extends StatelessWidget {
  Teacher({super.key});


  String? pickedimagefromGallery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Admin Session',
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),

            TextFormField(
              controller: _namecontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Student  Name',
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            TextFormField(
              controller: _agecontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Student Age',
              ),
            ),
             const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Student Address',
              ),
            ),
             const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: _classController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Class',
              ),
            ),
             const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: _programController,
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
                submitButtonClicked(context);
              },
              icon: const Icon(Icons.done_all_rounded),
              label: const Text('Submit'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }

  submitButtonClicked(context) async {
    final _name = _namecontroller.text.trim();
    final _age = _agecontroller.text.trim();
    final _address = _addressController.text.trim();
    final _class = _classController.text.trim();
    final _Program = _programController.text.trim();

    if (_name.isEmpty ||
        _age.isEmpty ||
        _address.isEmpty ||
        _class.isEmpty ||
        _Program.isEmpty   ) {
      return;
    }
    print('$_name,$_age $_Program,$_class,$_address');

    final _student = StudentModel(
        name: _name,
        age: _age,
        standard: _class,
        address: _address,
        program: _Program,
        imgofstudent: pickedimagefromGallery!);

    addStudent(_student);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SuccessFull(),
        ));
  }

 Future<void> imageFromGallery() async {
   XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
   pickedimagefromGallery = image!.path;
  }
}
