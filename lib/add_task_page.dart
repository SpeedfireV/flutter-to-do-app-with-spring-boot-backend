import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  late final FocusNode titleNode;
  late final FocusNode descriptionNode;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    titleNode = FocusNode();
    descriptionNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_box_rounded,
                size: 64,
                color: Colors.cyan.shade300,
              ),
              SizedBox(height: 16),
              Text(
                "New Task",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 80),
              TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    hintText: "Title",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide.none)),
                onTapOutside: (mouse) {
                  titleNode.unfocus();
                },
                onFieldSubmitted: (String query) {
                  descriptionNode.requestFocus();
                },
                controller: titleController,
                focusNode: titleNode,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    hintText: "Description",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide.none)),
                onTapOutside: (mouse) {
                  descriptionNode.unfocus();
                },
                onFieldSubmitted: (String query) {},
                controller: descriptionController,
                focusNode: descriptionNode,
              ),
              SizedBox(height: 24),
              SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        surfaceTintColor: Colors.green.shade300,
                        elevation: 7,
                        backgroundColor: Colors.green.shade300,
                        shape: BeveledRectangleBorder(),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Center(child: Text("Add Task")),
                          backgroundColor: Colors.green,
                        ));
                      },
                      child: Text(
                        "Add Task",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.w600),
                      ))),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Back To Tasks",
                ),
                style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                    shape: BeveledRectangleBorder()),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
    titleNode.dispose();
    descriptionNode.dispose();
  }
}
