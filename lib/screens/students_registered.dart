import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghss_periya/Controller/student_controller.dart';

import 'OpenScreen.dart';

class StudentsRegistered extends StatelessWidget {
final StudentController studentUpdater = Get.put(StudentController());

 StudentsRegistered({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registered Students'),
      ),
      body: SafeArea(
        child:
 GetX<StudentController>(
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
                      trailing: IconButton(
                          onPressed: () {
                            if (data.id != null) {
                              studentUpdater.deleteStudent(data.id!);
                            } else {
                              // print('id nnot found errrorr');
                            }
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
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
      
      
      ),
    );
  }
}
