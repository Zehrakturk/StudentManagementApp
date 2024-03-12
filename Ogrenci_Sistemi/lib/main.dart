import 'package:flutter/material.dart';
import 'package:ogrenci_sistemi/models/student.dart';
import 'package:ogrenci_sistemi/screens/student_add.dart';
import 'package:ogrenci_sistemi/screens/student_delete.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );

  }
}

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _HomeScreenState();
  }

}

class _HomeScreenState extends State {
  List<Student> students = [
    Student.withId(1, "Zehra", "Aktürk", 80),
    Student.withId(2, "Mert", "Karatekin", 45),
    Student.withId(3, "Ali", "Aktürk", 35),
  ];

  Student selectedStudent = Student.withId(0, "", "", 0);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ogrenci takip sistemi"),),
      body: buildBody(),

    );
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(students[index].firstName + " " +
                      students[index].lastName),
                  subtitle: Text("Sınavdan aldığı not : " +
                      students[index].grade.toString() + "   [" +
                      students[index].getStatus + "]"),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQB7Edtr5iShioBRPhcL8VnndTsDJlTRtgBA&usqp=CAU"),
                  ),
                  trailing: students[index].icon,
                  onTap: () {
                    setState(() {
                      this.selectedStudent = students[index];
                    });
                    print(this.selectedStudent.firstName);
                  },
                  onLongPress: () {
                    print("uzun basıldı");
                  },
                );
              }),
        ),
          Text("Seçili öğrenci " + selectedStudent.firstName),
          Row(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                flex:7,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.greenAccent),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add),
                      SizedBox(width: 1,),
                      Text("Yeni Ögrenci")
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)),
                    ).then((value) => setState(() {}));
                  },
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex:6,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white24)),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add),
                      SizedBox(width: 1,),
                      Text("Güncelle")
                    ],
                  ),
                  onPressed: () {
                    print("Güncelle");
                  },
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex:4,

                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.amberAccent)),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add),
                      SizedBox(width:0.6,),
                      Text("Sil")
                    ],
                  ),
                  onPressed: () {
                    Navigator.pop(context, MaterialPageRoute(builder: (context)=>StudentDelete(students)));
                  },
                ),
              )
            ],
          ),
      ],
    );
  }
}
