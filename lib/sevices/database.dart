import 'package:hive/hive.dart';

class ToDoDataBase {
  List todolist = [];
  List todolistC = [];

  // boxumuzun referansı
  final _mybox = Hive.box("mybox");

  // bu uygulamayı ilk kez açıyorsanız bu yöntemi çalıştırır
  void createInitialData() {
    todolist = [
      ["Make tutorial", "22", "20", "Yazi", false],
      ["Do exercise", "10", "15", "Yazi2", false],
      ["Araba silinecek", "10", "15", "Yaz3", false]
    ];
  }

  // database den veri alır
  void loadData() {
    todolist = _mybox.get("TODOLIST");
  }

  // database yi günceller
  void updateDataBase() {
    _mybox.put("TODOLIST", todolist);
  }
}
