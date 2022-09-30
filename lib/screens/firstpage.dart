import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:ghss_periya/screens/add_students.dart';
import 'package:ghss_periya/screens/home.dart';
import 'package:ghss_periya/screens/students/studentsstudentsview.dart';
import 'package:ghss_periya/screens/students_registered.dart';

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
              image: AssetImage('assets/img/Picsart_22-09-29_12-14-59-596.jpg'),
              fit: BoxFit.fill),
        ),
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextButton.icon(
                  onPressed: (() {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => StudentsRegisteredStudent(),
                    ));
                  }),
                  icon: const Icon(Icons.account_box ,size: 100, color: Colors.white,),
                  label: const Text('Student' ,style: TextStyle(color: Colors.white), ) ),
                  const SizedBox(
                    height: 50,
                  ),
              // TeacherButton
              TextButton.icon(
                  onPressed: (() {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
                  }),
                  icon: const Icon(Icons.school,size: 100,color: Colors.white,),
              label: const Text('Teacher' ,style: TextStyle(color: Colors.white), ) ),
            ]),
          ),
        ),
      ),
    );
  }
}
