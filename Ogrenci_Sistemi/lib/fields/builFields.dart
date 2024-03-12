import 'package:flutter/material.dart';

import '../models/student.dart';

class BuildFields extends StatefulWidget{

  List<Student>? students;
  Student? student;

  @override
  State<StatefulWidget> createState() {
    return _BuildFieldsState();
  }

  BuildFields(this.student){
    this.student=student;
  }

  BuildFields.add(this.students){
    this.students=students;
  }

}

class _BuildFieldsState extends State<BuildFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildFirstNameField(),
        buildLastNameField(),
        buildGradeField(),
      ],
    );
  }


  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci adı", hintText: "Zehra"),
      onSaved: (String? value) {
        if (value != null) {
          widget.student?.firstName = value;
        }
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Öğrenci soyadı", hintText: "Aktürk"),
      onSaved: (String? value) {
        if (value != null) {
          widget.student?.lastName = value;
        }
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci notu", hintText: "80"),
      onSaved: (String? value) {
        if (value != null) {
          widget.student?.grade = int.parse(value);
        }
      },
    );
  }

}