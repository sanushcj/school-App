import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String age;

  @HiveField(3)
  final String standard;

  @HiveField(4)
  final String address;

  @HiveField(5)
  final String program;

  @HiveField(6)
  String imgofstudent;

  StudentModel(
      {required this.name,
      required this.age,
      required this.standard,
      required this.address,
      required this.program,
      this.id,
      required this.imgofstudent});
}
