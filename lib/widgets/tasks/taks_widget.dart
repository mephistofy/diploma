import 'package:diploma_v1/helpers/box_decoration.dart';
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

    var width = MediaQuery.of(context).size.width;

    if (width < 600 ) {
      newText = (text.length < 600 ? text : text.substring(0, 600) + '...');
    } else if (width < 750 ) {
      newText = (text.length < 80 ? text : text.substring(0, 80) + '...');
    } else if (width < 900 ) {
      newText = (text.length < 220 ? text : text.substring(0, 220) + '...');
    } else if (width < 1000 ) {
      newText = (text.length < 80 ? text : text.substring(0, 80) + '...');
    } else if (width <= 1200 && width >= 1000) {
      newText = (text.length < 150 ? text : text.substring(0, 150) + '...');
    } else if (width < 1200 ){
      newText = (text.length < 120 ? text : text.substring(0, 120) + '...');
    }
    else {
      newText = (text.length < 80 ? text : text.substring(0, 80) + '...');
    }

    return Text(
      '      ' + newText,
      textAlign: TextAlign.justify,
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
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
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
              mainAxisSpacing: 40.0,
              crossAxisSpacing: 40.0,
            ),
            padding: EdgeInsets.all(40),
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
      task['id'].toString() + "\n" + "\n" +
          task['sender'] + "\n" + "\n" +
          task['created_at'].toString() + "\n" + "\n" +
          (task['executor'] != null
              ? task['executor']['name'] + "\n"
              : '')
      ,
      //unsortedTask['executor']['name'],
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
      ),
    );
  }

  Widget buildDepartment(task, context) => Ink(
    decoration: boxDecoration(),
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