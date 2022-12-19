import 'package:flutter/material.dart';
import 'package:ghss_periya/screens/students_registered.dart';
import 'add_students.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img/home_background.jpg'),
              fit: BoxFit.cover),
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
