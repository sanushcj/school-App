// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghss_periya/screens/Admin/adminpage.dart';

class TeacherPage extends StatelessWidget {
  const TeacherPage({super.key});



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
                  Obx(
                    () => Visibility(
                        visible: _datamatched.value,
                        child: const Text(
                          'Username Password Does not match',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        )),
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
    var username = _usernamecontroler.text.trim();
    var password = _passwordcontroller.text.trim();
    if (username == password) {
     Get.to(const AdminPage());
    } else {
      _datamatched.value = true;
    }
  }
}

final _datamatched = false.obs;
final _usernamecontroler = TextEditingController();
final _passwordcontroller = TextEditingController();
