import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constans/color.dart';
import 'package:todo_app/constans/tasktype.dart';
import 'package:todo_app/screens/addnewtask.dart';
import 'package:todo_app/sevices/database.dart';
import 'package:todo_app/todoitem.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("mybox");
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _mybox = Hive.box("mybox");

  ToDoDataBase db = ToDoDataBase();

  bool isChecked = false;

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todolist[index][4] = !db.todolist[index][4];
    });
    db.updateDataBase();
  }

  void initState() {
    // uygulama ilk açıldığında , varsayılan veriler oluşur
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
      db.updateDataBase();
    } else {
      db.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double telefonyuksekLigi = MediaQuery.of(context).size.height;
    double telefongenisligi = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backroundcolor),
          body: Column(children: [
            Container(
              width: telefongenisligi,
              height: telefonyuksekLigi / 3,
              decoration: const BoxDecoration(
                color: Colors.purple,
                image: DecorationImage(
                  image: AssetImage("lib/assets/images/image_2.png"),
                  fit: BoxFit.contain,
                ),
              ),
              child: const Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "12.12.2023",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    "My To Do List",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ]),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: db.todolist.length,
                  itemBuilder: (context, index) {
                    return TodoItem(
                      title: db.todolist[index][0],
                      gun: db.todolist[index][1],
                      yazi: db.todolist[index][2],
                      saat: db.todolist[index][3],
                      isCompleted: db.todolist[index][4],
                      onChanged: (value) => checkBoxChanged(value, index),
                    );
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "COMPLETED",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: db.todolistC.length,
                  itemBuilder: (context, index) {
                    return TodoItem(
                      title: db.todolistC[index][0],
                      gun: db.todolistC[index][1],
                      yazi: db.todolistC[index][2],
                      saat: db.todolistC[index][3],
                      isCompleted: db.todolistC[index][4],
                      onChanged: (value) => checkBoxChanged(value, index),
                    );
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddNewTask()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: HexColor("7E30E1"),
              ),
              child: const Text(
                "Add new task",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
