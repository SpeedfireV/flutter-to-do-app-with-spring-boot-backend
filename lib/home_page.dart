import 'package:flutter/material.dart';
import 'package:todo_app/add_task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyan.shade50,
        floatingActionButton: FloatingActionButton(
          shape: BeveledRectangleBorder(),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AddTaskPage();
            }));
          },
          child: Icon(Icons.add),
        ),
        body: ListView(
          children: [
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tasks",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    selected: true,
                    value: false,
                    title: Text("Task Title"),
                    tileColor: Colors.yellow,
                    subtitle: Text("Short Description"),
                    onChanged: (selected) {},
                  );
                })
          ],
        ),
      ),
    );
  }
}
