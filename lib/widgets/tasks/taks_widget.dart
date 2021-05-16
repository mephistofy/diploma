import 'package:diploma_v1/widgets/search.dart';
import 'package:diploma_v1/widgets/tasks/unsorted_task_action.dart';
import 'package:diploma_v1/widgets/tasks/unstartedTask.dart';
import 'package:flutter/material.dart';

class TasksDepartmentWidget extends StatefulWidget {
  final tasks;
  final tab;
  TasksDepartmentWidget ({Key key, this.tasks, this.tab}) : super(key: key);

  @override
  _TasksDepartmentWidgetState createState() => _TasksDepartmentWidgetState();
}

class _TasksDepartmentWidgetState extends State<TasksDepartmentWidget> {
  String query = '';

  List<Map> tasksList = <Map>[];
  var forSearch;

  @override
  void initState() {
    super.initState();

    if (widget.tasks.length != 0) {
      for (var i = 0; i < widget.tasks.length; ++i ) {

        final item = widget.tasks[i];

        print(item['department']['name']);
        print(widget.tab);
        if (item['department']['name'] == widget.tab) {
          print('--------------------------');
          tasksList.add(item);
        }
      }
    }
    forSearch = tasksList;
  }
  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: <Widget>[
          buildSearch(),
          body(),
        ],
    );
  }

  Widget getText(String text, context){
    print(text);
    var newText;

    if (MediaQuery.of(context).size.width < 600 ) {
      newText = (text.length < 1000 ? text : text.substring(1, 1000) + '...');
    } else if (MediaQuery.of(context).size.width < 750 ) {
      newText = (text.length < 250 ? text : text.substring(1, 250) + '...');
    } else if (MediaQuery.of(context).size.width < 900 ) {
      newText = (text.length < 370 ? text : text.substring(1, 370) + '...');
    } else if (MediaQuery.of(context).size.width < 1000 ) {
      newText = (text.length < 250 ? text : text.substring(1, 250) + '...');
    } else if (MediaQuery.of(context).size.width <= 1200 && MediaQuery.of(context).size.width >= 1000) {
      newText = (text.length < 300 ? text : text.substring(1, 300) + '...');
    } else if (MediaQuery.of(context).size.width < 1200 ){
      newText = (text.length < 500 ? text : text.substring(1, 500) + '...');
    }
    else {
      newText = (text.length < 200 ? text : text.substring(1, 200) + '...');
    }

    return Text(
      newText,
      style: TextStyle(
        fontSize: 18.0,
      ),
    );
  }

  Widget taskFilter(task){
    var widget;

    if (task['executor'] == null){
      widget = UnstartedTaskUpdateForm(task: task);
    }
    else if (task['finished_at'] != null) {
      widget = UnstartedTaskUpdateForm(task: task);
    }
    else {
      widget = UnstartedTaskUpdateForm(task: task);
    }
    return widget;
  }
  Future<void> showTask(context, task) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            scrollable: true,
            title: Center(
              child: Text(task['id'].toString()),
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

                taskFilter(task),
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
            itemCount: tasksList.length,
            itemBuilder: (BuildContext context, int index){
              final department = tasksList[index];
              return buildDepartment(department,context);
            }
        )
    );
  }

  Widget textForTitle(task){
    return Text(
      task['id'].toString() + "\n" +
          task['sender'] + "\n" +
          task['created_at'].toString() + "\n" +
          (task['executor'] != null
              ? task['executor']['name']
              : '')
      ,
      //unsortedTask['executor']['name'],
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20.0,
      ),
    );
  }

  Widget buildDepartment(task, context) => Ink(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue, width: 4.0),
      borderRadius: BorderRadius.circular(20.0),
      //color: Colors.indigo[900],
      //shape: BoxShape.circle,
    ),
    //color: Colors.lightGreen,
    child: ListTile(
        title: textForTitle(task),
        subtitle: getText(task['content'], context),
        onTap: () => showTask(context, task)
    ),
  );

  Widget buildSearch() => SearchWidget(
    text: query,
    hintText: 'Введите email отправителя, id или текст из задачи',
    onChanged: searchBook,
  );

  void searchBook(String query) {
    print(query);
    final users = forSearch.where((task) {
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
      this.tasksList = users;
    });
  }
}