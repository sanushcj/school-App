import 'package:flutter/material.dart';
import 'package:ghss_periya/db/model/data_model.dart';
import 'package:ghss_periya/screens/firstpage.dart';
import 'package:hive_flutter/adapters.dart';

main() async {
  Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(const Mainpage());
}

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      title: 'GHSS PERIYA',
      home: const Firstpagee(),
    );
  }
}
