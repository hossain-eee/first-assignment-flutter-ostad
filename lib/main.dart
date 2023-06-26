import 'package:flutter/material.dart';
import 'package:assignment_module_8/model_task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Task list form model Task instance
  List<Task> todo = [
    Task('Flutter', 'Conducted by Ostad', '2'),
  ];

  //add todo
  void addNewTodo() {
    todo.add(Task(
      titleController.text,
      descriptionController.text,
      deadlineController.text,
      // int.parse(deadlineController.text),
    ));
  }

  //Controller for TextFiled
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();

  //TextFiled for title, description, deadline
  Widget textField(
      String hintText, int maxLines, TextEditingController controller,
      [double height = 0]) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(height: height),

        alignLabelWithHint: true,
        // contentPadding: EdgeInsets.symmetric(vertical: 70, horizontal: 10),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(4)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.red[300]!),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  //dialog box to add new task for FAB
  void showDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: Text("Add Task"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //title field
                textField('Title', 1, titleController),
                SizedBox(
                  height: 10,
                ),
                //descriptiion field
                textField("Description", 5, descriptionController, 4),
                SizedBox(
                  height: 10,
                ),
                //deadline field
                textField('Days required', 1, deadlineController)
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  addNewTodo();
                  titleController.clear();
                  descriptionController.clear();
                  deadlineController.clear();
                  Navigator.pop(context);
                  setState(() {});
                },
                child: const Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Management"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // showDialogBox(context);
          print("fab button press");
          showDialogBox(context);
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todo.length,
        itemBuilder: (context, index) {
          //gesture tap effect on Each list
          return ListTile(
            title: Text(todo[index].title),
            subtitle: Text(todo[index].description),
          );
        },
      ),
    );
  }
}
