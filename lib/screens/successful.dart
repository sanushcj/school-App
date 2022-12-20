import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:ghss_periya/screens/Admin/add_students.dart';
import 'package:ghss_periya/screens/students_registered.dart';

class SuccessFull extends StatelessWidget {
  const SuccessFull({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const Text(
              'Student Registered SuccessFully',
              style: TextStyle(fontSize: 60),
            ),
            TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Teacher(),
                  ));
                },
                icon: const Icon(Icons.app_registration),
                label: const Text('Add Again')),
            TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  StudentsRegistered(),
                  ));
                },
                icon: const Icon(Icons.app_registration),
                label: const Text('View Students')),
          ],
        ),
      )),
    );
  }
}
