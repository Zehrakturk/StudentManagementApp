import 'package:flutter/material.dart';
import 'package:ogrenci_sistemi/fields/builFields.dart';
import '../models/student.dart';

class StudentDelete extends StatefulWidget{

  List<Student> students;

  @override
  State<StatefulWidget> createState() {
    return _StudentDeleteState();
  }

  StudentDelete(this.students);

}

class _StudentDeleteState extends State<StudentDelete>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: <Widget>[
              BuildFields(widget.students),

            ],
          )
        )

      ),

    );
  }

}
