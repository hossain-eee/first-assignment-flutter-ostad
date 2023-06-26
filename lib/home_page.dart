import 'package:flutter/material.dart';
import 'package:assignment_module_8/model_task.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Task list form model Task instance
  List<Task> todo = [
    Task('Flutter 1', 'Conducted by Ostad', '2'),
    Task('Flutter 2', 'Conducted by Ostad', '2'),
    Task('Flutter 3', 'Conducted by Ostad', '2'),
    Task('Flutter 4', 'Conducted by Ostad', '2'),
    Task('Flutter 5', 'Conducted by Ostad', '2'),
  ];


  //add new item to todo list
  void addNewTodo() {
    todo.add(Task(
      _titleController.text,
      _descriptionController.text,
      _deadlineController.text,
      // int.parse(deadlineController.text),
    ));
  }

//delete todo item
  void deleteTodoItem(int index) {
    todo.removeAt(index);
    setState(() {});
  }

  //Controller for TextFiled
 final TextEditingController _titleController = TextEditingController();
 final TextEditingController _descriptionController = TextEditingController();
 final TextEditingController _deadlineController = TextEditingController();

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

  //dialog box to add new task by FAB
  void showDialogBox(BuildContext context) {
    showDialog(
      useSafeArea: true,
      context: context,
      builder: (_) {
        return Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: AlertDialog(
              title: Text("Add Task"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //title field
                  textField('Title', 1, _titleController),
                  SizedBox(
                    height: 10,
                  ),
                  //descriptiion field
                  textField("Description", 5, _descriptionController, 4),
                  SizedBox(
                    height: 10,
                  ),
                  //deadline field
                  textField('Days required', 1, _deadlineController)
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    //condition for add new todo that every controller has to have value
                    if (_titleController.text.trim().isNotEmpty &&
                        _descriptionController.text.trim().isNotEmpty &&
                        _deadlineController.text.trim().isNotEmpty) {
                      addNewTodo(); //add new todo item
                    }

                    _titleController.clear();
                    _descriptionController.clear();
                    _deadlineController.clear();

                    if (mounted) {
                      setState(() {});
                    }
                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 232, 232),
      appBar: AppBar(
        title: const Text("Task Management"),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // showDialogBox(context);

          showDialogBox(context);
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todo.length,
        itemBuilder: (context, index) {
          //gesture tap effect on Each list
          return GestureDetector(
            onLongPress: () {
              //called bottomsheet
              showBottomSheets(context, index);
              setState(() {});
            },
            child: ListTile(
              title: Text(todo[index].title),
              subtitle: Text(todo[index].description),
            ),
          );
        },
      ),
    );
  }

//method for showBottomSheet, here will show bottomsheet with specific task details and with Delete button to delete the click item
  void showBottomSheets(BuildContext context, int currentIndex) {
    Scaffold.of(context).showBottomSheet<void>(
      (BuildContext context) {
        return GestureDetector(
          onDoubleTap: () {
            //when double click on bottomsheet then it will remove
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.centerLeft,
            height: 200,
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Task Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Title: ${todo[currentIndex].title}',
                  textAlign: TextAlign.left,
                ),
                Text('Description: ${todo[currentIndex].description}'),
                Text('Days Required: ${todo[currentIndex].deadline}'),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    child: const Text('Delete'),
                    onPressed: () {
                      deleteTodoItem(currentIndex);
                      if (mounted) {
                        setState(() {});
                      }

                      Navigator.pop(
                          context); //remove bottomsheet with delete todo item
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}
