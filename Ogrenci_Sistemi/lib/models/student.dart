import 'package:flutter/material.dart';

class Student{
  late int id;
  late String firstName;
  late String lastName;
  late int grade;
  late String status;
  late Widget icon;

  Student(String firstname, String lastName,int grade){
    this.firstName=firstname;
    this.lastName=lastName;
    this.grade=grade;
  }

  Student.withId(int id,String firstname, String lastName,int grade){
    this.id=id;
    this.firstName=firstname;
    this.lastName=lastName;
    this.grade=grade;
  }

  Student.empty(int id){
    this.id=id;
  }

  String get getStatus {
    String message = "";
    if(this.grade>=50){
      message="Geçti";
      this.icon=Icon(Icons.done);
    }
    else if(this.grade>40){
      message="Bütünlemeye kaldı";
      this.icon=Icon(Icons.album);
    }
    else{
      message="Kaldı";
      this.icon=Icon(Icons.clear);
    }
    this.status=message;
    return this.status;
  }
}
