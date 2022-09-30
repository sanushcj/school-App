import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StudentsPagee extends StatelessWidget {
  String name;
  String age;
  String standard;
  String address;
  String program;
  // String? id;
  String imgofstudent;

  StudentsPagee(
      {super.key, required this.name,
      required this.age,
      required this.standard,
      required this.address,
      required this.program,
      required this.imgofstudent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        
          child: Center(
            child: Container(
              width: 1000,
              color: Color.fromARGB(173, 128, 0, 255),
            //  decoration: BoxDecoration(color: Color.fromARGB(187, 104, 44, 114),
            //  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                          backgroundImage:
                              FileImage(File(imgofstudent.toString())),
                       radius: 150.0 ),
                  Text('NAME :$name'),
                  Text('CLASS : $standard'),
                  Text('ADDRESS : $address'),
                  Text('AGE : $age'),
                  Text('PROGRAME : $program'),

              //       ElevatedButton(
              //   onPressed: () {},
              //   child: const Text(
              //     "Edit Student",
              //     style: TextStyle(fontSize: 25),
              //   ),
              // ),

                  
                ],
              ),
            ),
          )),
    );
  }
}
