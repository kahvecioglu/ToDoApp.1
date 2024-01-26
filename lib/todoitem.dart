import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String title;
  final bool isCompleted;
  Function(bool?)? onChanged;
  final String gun;
  final String saat;
  final String yazi;

  TodoItem({
    Key? key,
    required this.title,
    required this.isCompleted,
    required this.gun,
    required this.onChanged,
    required this.yazi,
    required this.saat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isCompleted ? Colors.grey : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
                "lib/assets/images/category_1.png"), // Buradaki asset path'i doğru olduğundan emin olun
            Expanded(
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      decoration: isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                  ),
                  Text(
                    gun,
                    style: TextStyle(
                      decoration: isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  Text(
                    saat,
                    style: TextStyle(
                      decoration: isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  Text(
                    yazi,
                    style: TextStyle(
                      decoration: isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  )
                ],
              ),
            ),
            Checkbox(
              value: isCompleted,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
