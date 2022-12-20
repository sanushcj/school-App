

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:ghss_periya/Controller/student_controller.dart';
import 'package:ghss_periya/db/functions/database_functions.dart';
import 'package:ghss_periya/db/model/data_model.dart';
import 'package:ghss_periya/screens/Admin/add_students.dart';
import 'package:ghss_periya/screens/students/studentslist.dart';

import '../OpenScreen.dart';

class StudentsRegisteredStudent extends StatelessWidget {
  const StudentsRegisteredStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registered Students'),
        ),
        body: SafeArea(

        
          child: GetX<StudentController>(
   builder: (controller) {
     return ListView.separated(
                  itemBuilder: (context, index) {
                    final data = studentUpdater.studentListUpdate[index];
                    return ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ViewaAstudent(
                            index: index,
                            name: data.name,
                            age: data.age,
                            standard: data.standard,
                            address: data.address,
                            program: data.program,
                            imgofstudent: data.imgofstudent,
                          ),
                        ));
                      },
                      title: Text(data.name),
                      subtitle: Text(data.program),
                     
                      leading: CircleAvatar(
                        backgroundImage:
                            FileImage(File(data.imgofstudent.toString())),
                        radius: 30.0,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: studentUpdater.studentListUpdate.length
                );
   }
 ),
        ));
  }
}
