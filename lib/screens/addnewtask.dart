import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constans/color.dart';
import 'package:todo_app/constans/tasktype.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/sevices/database.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  TextEditingController tittleController = TextEditingController();
  TextEditingController gunController = TextEditingController();
  TextEditingController saatController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  ToDoDataBase db = ToDoDataBase();

  Tasktype tasktype = Tasktype.notes;
  @override
  Widget build(BuildContext context) {
    double telefonyuksekligi = MediaQuery.of(context).size.height;
    double telefongenisligi = MediaQuery.of(context).size.width;

    void saveNewTask() {
      setState(() {
        db.loadData();
        db.todolist.add([
          tittleController.text,
          gunController.text,
          saatController.text,
          descriptionController.text,
          false
        ]);
        db.updateDataBase();
      });

      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backroundcolor),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: telefongenisligi,
                height: telefonyuksekligi / 8,
                color: Colors.purple,
                child: Row(children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 40,
                        color: Colors.white,
                      )),
                  const Expanded(
                      child: Text(
                    "Add new task",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 31),
                  ))
                ]),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text("Task tittle")),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: tittleController,
                  decoration: const InputDecoration(
                      filled: true, fillColor: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("Category"),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(milliseconds: 300),
                              content: Text("Category Completed"),
                            ),
                          );
                          setState(() {
                            tasktype = Tasktype.notes;
                          });
                        },
                        child: Image.asset("lib/assets/images/category_1.png"),
                      ),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(milliseconds: 300),
                              content: Text("Category Completed"),
                            ),
                          );
                          setState(() {
                            tasktype = Tasktype.calendar;
                          });
                        },
                        child: Image.asset("lib/assets/images/category_2.png"),
                      ),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(milliseconds: 300),
                              content: Text("Category Completed"),
                            ),
                          );
                          setState(() {
                            tasktype = Tasktype.contest;
                          });
                        },
                        child: Image.asset("lib/assets/images/category_3.png"),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text("Date"),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: gunController,
                                decoration: const InputDecoration(
                                    filled: true, fillColor: Colors.white),
                              ))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text("Time"),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: saatController,
                                decoration: const InputDecoration(
                                    filled: true, fillColor: Colors.white),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 20), child: Text("Notes")),
              SizedBox(
                height: 300,
                child: TextField(
                    controller: descriptionController,
                    expands: true,
                    maxLines: null,
                    decoration: const InputDecoration(
                        filled: true, fillColor: Colors.white, isDense: true)),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor("7E30E1")),
                  onPressed: () {
                    saveNewTask();
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
