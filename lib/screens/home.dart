// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:ghss_periya/screens/add_students.dart';
import 'package:ghss_periya/screens/adminPage.dart';
import 'package:ghss_periya/db/functions/database_functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

bool _datamatched = false;
final _usernamecontroler = TextEditingController();
final _passwordcontroller = TextEditingController();

class _HomePageState extends State<HomePage> {
  @override

  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img/home_background.jpg'),
                fit: BoxFit.fill),
          ),
          child: Form(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextField(
                controller: _usernamecontroler,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Username',
                  fillColor: Color.fromARGB(145, 255, 255, 255),
                  filled: true,
                ),
              ),
              const SizedBox(
                height: 25,
              ),

              // text field 2
              TextField(
                controller: _passwordcontroller,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Password',
                  fillColor: Color.fromARGB(145, 255, 255, 255),
                  filled: true,
                ),
              ),
              const SizedBox(
                height: 25,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: _datamatched,
                    child: const Text(
                      'Username Password Does not match',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                      onPressed: (() {
                        signin();
                      }),
                      icon: const Icon(Icons.login),
                      label: const Text('Login')),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  signin() {
    var username = 'sanush';
    var password = 'gokul';
    if (_usernamecontroler.text.trim() == username &&
        _passwordcontroller.text.trim() == password) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const AdminPage(),
      ));
    } else {
      setState(() {
        _datamatched = true;
      });
    }
  }
}
