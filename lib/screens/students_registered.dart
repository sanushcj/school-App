import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ghss_periya/db/functions/database_functions.dart';
import 'package:ghss_periya/screens/studentViewScreen.dart';

import '../db/model/data_model.dart';

class StudentsRegistered extends StatelessWidget {
  const StudentsRegistered({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registered Students'),
        ),
        body: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: studentListNotifier,
            builder: (BuildContext ctx, List<StudentModel> studentList,
                Widget? child) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  final data = studentList[index];
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
                            deleteStudent(data.id!);
                          } else {
                            print('id nnot found errrorr');
                          }
                        },
                        icon: const Icon(Icons.delete , color: Colors.red,)),
                    leading: CircleAvatar(
                      backgroundImage:
                          FileImage(File(data.imgofstudent.toString())),
                   radius: 30.0, ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: studentList.length,
              );
            },
          ),
        ));
  }
}