// import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';

import 'Admin/editscreen.dart';

class ViewaAstudent extends StatelessWidget {
  String name;
  String age;
  String standard;
  String address;
  String program;
  // String? id;
  int index;
  String imgofstudent;

  ViewaAstudent(
      {super.key,
      required this.index,
      required this.name,
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
          color: const Color.fromARGB(170, 9, 77, 28),
          //  decoration: BoxDecoration(color: Color.fromARGB(187, 104, 44, 114),
          //  ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                  backgroundImage: FileImage(File(imgofstudent.toString())),
                  radius: 150.0),
              Text('NAME :$name'),
              Text('CLASS : $standard'),
              Text('ADDRESS : $address'),
              Text('AGE : $age'),
              Text('PROGRAME : $program'),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditStudent( 
                        index: index,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Edit Student",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
