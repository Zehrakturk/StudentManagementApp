import 'package:flutter/material.dart';
import 'package:ogrenci_sistemi/fields/builFields.dart';
import 'package:ogrenci_sistemi/models/student.dart';


class StudentAdd extends StatefulWidget{

  List<Student> students;

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }

  StudentAdd(this.students);
}

class _StudentAddState extends State<StudentAdd> {

  var formKey = GlobalKey<FormState>();

  Student student = Student.empty(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yeni öğrenci ekle"),),
      body: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
              key:formKey,
              child: Column(
                  children: <Widget>[
                    BuildFields(student),


                  ]
              )
          )

      ),
    );
  }

  Widget builSubmitButton (){
    return ElevatedButton(
      child: Text("Kaydet"),
      onPressed: (){
        formKey.currentState?.save();
        widget.students.add(student);
      },
    );
  }
}