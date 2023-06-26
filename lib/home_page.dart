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

  //index for specific item
  int idices = 0;
  //valueNotifier to maintain state

  // final ValueNotifier<Task> valueNotifier = ValueNotifier()

  //add todo
  void addNewTodo() {
    todo.add(Task(
      titleController.text,
      descriptionController.text,
      deadlineController.text,
      // int.parse(deadlineController.text),
    ));
  }

//delete todo
  void deleteTodoItem(int index) {
    todo.removeAt(index);
    setState(() {});
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
      backgroundColor: Color.fromARGB(255, 232, 232, 232),
      appBar: AppBar(
        title: const Text("Task Management"),
        centerTitle: true,
        elevation: 0,
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
          idices = index;
          //gesture tap effect on Each list
          return GestureDetector(
            onTap: () {
              /* Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return Column(
                      children: [
                        // DetailsTask(),
                         DetailsTask(


                          todo: todo[index],
                          index: index,
                          deleteFunction: deleteTodoItem,
                          scaffold: Scaffold(appBar: AppBar(title: Text("Scaffold"),),),
                        ), 
                      ],
                    );
                  },
                ),
              ); */

              // showBottomSheet();
              showBottomSheets(context);
              setState(() {});
              /*   DetailsTak(
                  title: todo[index].title,
                  subTitle: todo[index].description,
                  index: index);
              print("Press in the list of index $index"); */
              print("Press in the list of index $index");
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

/*   void showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("Title : ${todo[idices].title}"),
                // title: Text("Title :"),
                subtitle: Text(
                    "Description : ${todo[idices].description}"),
                    // "Description : "),
              )
            ],
          );
        });
  } */

//method for showBottomSheet, here will show bottomsheet with specific task details and with Delete button to delete the click item
  void showBottomSheets(BuildContext context) {
    Scaffold.of(context).showBottomSheet<void>(
      (BuildContext context) {
        return Container(
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
                'Title: ${todo[idices].title}',
                textAlign: TextAlign.left,
              ),
              Text('Description: ${todo[idices].description}'),
              Text('Days Required: ${todo[idices].deadline}'),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  child: const Text('Delete'),
                  onPressed: () {
                    deleteTodoItem(idices);
                    Navigator.pop(context);
                  })
            ],
          ),
        );
      },
    );
  }
}
