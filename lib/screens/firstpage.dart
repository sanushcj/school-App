import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:ghss_periya/screens/add_students.dart';
import 'package:ghss_periya/screens/home.dart';
import 'package:ghss_periya/screens/students/studentsstudentsview.dart';
import '../db/functions/database_functions.dart';

class Firstpagee extends StatelessWidget {
  const Firstpagee({super.key});

  @override
  Widget build(BuildContext context) {
    getallstudents();
    return Scaffold(
        body: SafeArea(
            child: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 1,
          image: AssetImage('assets/img/home_background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextButton.icon(
              onPressed: (() {
               Get.to(const StudentsRegisteredStudent());
              }),
              icon: const Icon(
                Icons.account_box,
                size: 100,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 10,
                  )
                ],
              ),
              label: const Text(
                'Student',
                style: TextStyle(color: Colors.white, shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 10,
                  )
                ]),
              )),
          const SizedBox(
            height: 50,
          ),
          // TeacherButton
          TextButton.icon(
            onPressed: (() {
          Get.to(const TeacherPage());
            }),
            icon: const Icon(Icons.school,
                size: 100,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 10,
                  )
                ]),
            label: const Text(
              'Teacher',
              style: TextStyle(color: Colors.white, shadows: [
                Shadow(
                  color: Colors.black,
                  blurRadius: 10,
                )
              ]),
            ),
          )
        ]),
      ),
    )));
  }
}
