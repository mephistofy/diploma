import 'package:diploma_v1/fake_data/unsorted_tasks.dart';
import 'package:diploma_v1/helpers/box_decoration.dart';
import 'package:diploma_v1/helpers/hover_container.dart';
import 'package:diploma_v1/side_drawers/app_bar.dart';
import 'package:diploma_v1/side_drawers/side_drawers.dart';
import 'package:diploma_v1/widgets/search.dart';
import 'package:diploma_v1/widgets/tasks/unsorted_task_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hovering/hovering.dart';

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
      appBar: customAppBar('Несортированные заявки', context),
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

    var width = MediaQuery.of(context).size.width;
    if (width < 600 ) {
      newText = (text.length < 650 ? text : text.substring(0, 650) + '...');
    } else if (width < 900 ) {
      newText = (text.length < 100 ? text : text.substring(0, 100) + '...');
    } else if (width < 1000 ){
      newText = (text.length < 150 ? text : text.substring(0, 150) + '...');
    } else if (width < 1200 ){
      newText = (text.length < 250 ? text : text.substring(0, 250) + '...');
    }
    else {
      newText = (text.length < 150 ? text : text.substring(0, 150) + '...');
    }

    return Text(
      '      ' +newText,
      style: TextStyle(
        fontSize: 16.0,
      ),
    );
  }
  Future<void> showUnsortedTask(context, unsortedTask) async {
    return showDialog<void>(

      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
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
              mainAxisSpacing: 40.0,
              crossAxisSpacing: 40.0,
            ),
            padding: EdgeInsets.all(40),
            itemCount: unsortedTasksList.length,
            itemBuilder: (BuildContext context, int index){
              final department = unsortedTasksList[index];
              return buildUnsortedTask(department,context);
            }
        )
    );
  }

  Widget buildUnsortedTask(unsortedTask, context) => hover_container(
    child: ListTile(
        title: Text(
          unsortedTask['id'].toString() + "\n" + "\n" +
              unsortedTask['sender'] + "\n" + "\n" +
              unsortedTask['created_at'].toString() + "\n",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold
          ),
        ),
        subtitle: getText(unsortedTask['content'], context),
        onTap: () => showUnsortedTask(context, unsortedTask)
    ),
  );

  Widget buildSearch() => SearchWidget(
    text: query,
    hintText: 'Введите email отправителя, id или текст из задачи',
    onChanged: searchUnsortedTask,
  );

  void searchUnsortedTask(String query) {
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