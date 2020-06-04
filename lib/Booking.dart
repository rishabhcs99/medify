import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'Successful.dart';

void main() => runApp(Booking());

/// This Widget is the main application widget.
///
class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}

class Booking extends StatelessWidget {
  static const String _title = 'Booking Details';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue[600], accentColor: Colors.blueAccent),

      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatefulWidget(),
          backgroundColor:Colors.white
      ),
      debugShowCheckedModeBanner: false,
      color:Colors.grey,
    );
  }
}


enum SingingCharacter { a, b, c, d }

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  SingingCharacter _character = SingingCharacter.a;

  CalendarController _controller;
  var dateSel;
  var dateCheck;
  var timeSel = "15:00 - 15:30";
  var A = "15:00 - 15:30";
  var B = "15:30 - 16:00";
  var C = "16:00 - 16:30";
  var D = "16:30 - 17:00";
  var marr = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
  }

  void onBook() {
    //_showDialog();

    if (dateSel == null) {
      _showNullError();
    } else {
      var x = (DateTime.now().toIso8601String().substring(0, 10));
      var y = (dateCheck.substring(0, 10));
      if (x.compareTo(y) <= 0) {
        _showDialog();
      } else {
        _showError();
      }
      //DateTime.now().toIso8601String().substring(0,11);

    }
  }

  void _showError() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Error"),
          content: new Text("Please make sure you select a future date."),
          elevation: 24.0,
          backgroundColor: Colors.white,

          //shape: CircleBorder(),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showNullError() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Error"),
          content: new Text("Please make sure you select a date."),
          elevation: 24.0,
          backgroundColor: Colors.white,
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Booking Details"),
          content: new Text(
              "Are you sure you wish to book an appointment for$dateSel,$timeSel ? "),
          elevation: 24.0,
          backgroundColor: Colors.white,
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Confirm"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context,MaterialPageRoute(builder:(context)=>Successful(s1:dateSel,s2:timeSel)));

              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              onDaySelected: (date, events) {
                dateSel = " ${date.day}  ${marr[date.month + 1]} ";
                dateCheck = date.toIso8601String();
              },
              initialCalendarFormat: CalendarFormat.week,
              calendarStyle: CalendarStyle(
                  todayColor: Colors.blue[600],
                  selectedColor: Colors.blue[800],
                  todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17.0)),
              calendarController: _controller,
              startingDayOfWeek: StartingDayOfWeek.monday,
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonShowsNext: false,
              ),
            )
          ],
        ),
        SizedBox(height: 20.0),
        Container(),
        Column(
          children: <Widget>[
            SizedBox(
              height: 17.0,
            ),
            Card(
                color: Colors.blue[600],
                elevation: 3.0,
                child: ListTile(
                  title: Text('15:00 - 15:30',style: TextStyle(color: Colors.grey[200]),),
                  dense: false,
                  onTap: () {
                    timeSel = A;
                    onBook();
                  },
                )),
            Card(
                color: Colors.blue[600],
                elevation: 3.0,
                child: ListTile(
                  title: Text('15:30 - 16:00',style: TextStyle(color: Colors.grey[200]),),

                  dense: false,
                  onTap: () {
                    timeSel = A;
                    onBook();
                  },
                )),
            Card(
                color: Colors.blue[600],
                elevation: 3.0,
                child: ListTile(
                  title: Text('16:00 - 16:30',style: TextStyle(color: Colors.grey[200]),),
                  dense: false,
                  onTap: () {
                    timeSel = A;
                    onBook();
                  },
                )),
            Card(
                color: Colors.blue[600],
                elevation: 3.0,
                child: ListTile(
                  title: Text('16:30 - 17:00',style: TextStyle(color: Colors.grey[200]),),
                  dense: false,
                  onTap: () {
                    timeSel = A;
                    onBook();
                  },
                )),
            SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ],
    );
  }
}
