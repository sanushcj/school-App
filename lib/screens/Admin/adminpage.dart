import 'package:flutter/material.dart';
import 'package:ghss_periya/screens/add_students.dart';
import 'package:ghss_periya/screens/students_registered.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img/Picsart_22-09-29_12-14-59-596.jpg'),
              fit: BoxFit.fill),
        ),
            child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const StudentsRegistered()));
                },
                child: const Text(
                  "View Students",
                  style: TextStyle(fontSize: 25),
                ),
              ),
               ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  Teacher()));
                },
                child: const Text(
                  "Add Student",
                  style: TextStyle(fontSize: 25),
                ),
              ),
             
            ],
        ),
      ),
          )
      ),
    );
  }
}
