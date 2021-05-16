import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Statistics extends StatefulWidget {
  final department;
  Statistics ({Key key, this.department}) : super(key: key);

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  final globalFormKey = GlobalKey<FormState>();
  final scaffoldMessengerKey = GlobalKey<ScaffoldState>();

  Map<String, double> dataMap = {
    "Завершено заявок": 5,
    "В работе": 3,
  };

  List<Widget> cards(){
    return  [
        Container(
          margin: EdgeInsets.only(left: 30, top: 30, right: 30, bottom: 50),
          height: 250.0,
          width: 250.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 10.0,
              ),
              Icon(
                  Icons.pending_actions_rounded,
                  size: 120.0,
              ),
              Text(
                  'В работе',
                  style: TextStyle(fontSize: 20.0)),
              Text(
                  dataMap['В работе'].toString(),
                  style: TextStyle(fontSize: 50.0)
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          )
        ),

        Container(
          margin: EdgeInsets.only(left: 30, top: 30, right: 30, bottom: 50),
          height: 250.0,
          width: 250.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Icon(
                  Icons.done_all_outlined,
                  size: 120.0,
                ),
                Text(
                    'Завершено заявок',
                    style: TextStyle(fontSize: 20.0)),
                Text(
                    dataMap['Завершено заявок'].toString(),
                    style: TextStyle(fontSize: 50.0)
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            )
        ),

        Container(
          margin: EdgeInsets.only(left: 30, top: 30, right: 30, bottom: 50),
          height: 250.0,
          width: 250.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Icon(
                  Icons.all_inbox,
                  size: 120.0,
                ),
                Text(
                    'Всего',
                    style: TextStyle(fontSize: 20.0)),
                Text(
                    (dataMap['В работе'] + dataMap['Завершено заявок']).toString(),
                    style: TextStyle(fontSize: 50.0)
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            )
        ),
      ];
  }

  Widget chart() {
    return PieChart(
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      colorList: [Colors.green, Colors.blue],
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 32,
      //centerText: "HYBRID",
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: true,
        //legendShape: _BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
         children: <Widget> [
           if (MediaQuery.of(context).size.width < 1000)
             Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children:cards(),
             ),

           if (MediaQuery.of(context).size.width > 1000)
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children:cards(),
             ),

           chart(),

           SizedBox(
             height: 50.0,
           )
         ],
        ),
    );
  }
}
