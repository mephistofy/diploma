import 'package:diploma_v1/fake_data/unsorted_tasks.dart';
import 'package:diploma_v1/side_drawers/app_bar.dart';
import 'package:diploma_v1/side_drawers/side_drawers.dart';
import 'package:diploma_v1/widgets/search.dart';
import 'package:diploma_v1/widgets/unsorted_task_action.dart';
import 'package:flutter/material.dart';

class UnsortedTasks extends StatefulWidget {
  UnsortedTasks ({Key key}) : super(key: key);

  @override
  _UnsortedTasksState createState() => _UnsortedTasksState();
}

class _UnsortedTasksState extends State<UnsortedTasks> {
  String query = '';
  var unsortedTasksList;

  @override
  void initState() {
    super.initState();

    unsortedTasksList = UNSORTED_TASKS;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: CustomAppBar('Несортированные заявки'),
      body:
      Column(
        children: <Widget>[
          buildSearch(),
          body(),
        ],
      ),
    );
  }

  Widget getText(String text, context){
    print(text);
    var newText;

    if (MediaQuery.of(context).size.width < 600 ) {
      newText = (text.length < 1000 ? text : text.substring(1, 1000) + '...');
    } else if (MediaQuery.of(context).size.width < 900 ) {
      newText = (text.length < 270 ? text : text.substring(1, 370) + '...');
    } else if (MediaQuery.of(context).size.width < 1200 ){
      newText = (text.length < 250 ? text : text.substring(1, 250) + '...');
    }
    else {
      newText = (text.length < 300 ? text : text.substring(1, 300) + '...');
    }

    return Text(
      newText,
      style: TextStyle(
        fontSize: 18.0,
      ),
    );
  }
  Future<void> showUnsortedTask(context, unsortedTask) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            scrollable: true,
            title: Center(
              child: Text(unsortedTask['id'].toString()),
            ),
            content: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  right: -50.0,
                  top: -90.0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.close),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),

                UnsortedTaskUpdateForm(unsortedTask: unsortedTask),
              ],
            )
        );
      },
    );
  }

  Widget body (){
    return Expanded(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (MediaQuery.of(context).size.width~/300),
              // childAspectRatio: 19 / 12,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
            padding: EdgeInsets.all(8),
            itemCount: unsortedTasksList.length,
            itemBuilder: (BuildContext context, int index){
              final department = unsortedTasksList[index];
              return buildDepartment(department,context);
            }
        )
    );
  }

  Widget buildDepartment(unsortedTask, context) => ListTile(
      title: Text(
        unsortedTask['id'].toString() + "\n" +
        unsortedTask['sender'] + "\n" +
        unsortedTask['created_at'].toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      subtitle: getText(unsortedTask['content'], context),
      onTap: () => showUnsortedTask(context, unsortedTask)
  );

  Widget buildSearch() => SearchWidget(
    text: query,
    hintText: 'Введите email отправителя, id или текст из задачи',
    onChanged: searchBook,
  );

  void searchBook(String query) {
    print(query);
    final users = UNSORTED_TASKS.where((task) {
      final contentLower = task['content'].toString().toLowerCase();
      final senderLower = task['sender'].toString().toLowerCase();
      final idLower = task['id'].toString().toLowerCase();
      final searchLower = query.toLowerCase();

      return contentLower.contains(searchLower) ||
             senderLower.contains(searchLower) ||
             idLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.unsortedTasksList = users;
    });
  }
}