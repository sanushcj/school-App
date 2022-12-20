import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghss_periya/db/model/data_model.dart';
import 'package:ghss_periya/screens/firstpage.dart';
import 'package:hive_flutter/adapters.dart';

main() async {
   WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(const Mainpage());
}

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      title: 'GHSS PERIYA',
      home: const Firstpagee(),
    );
  }
}
