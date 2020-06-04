import 'package:flutter/material.dart';

class Successful extends StatelessWidget{

  String s1="";
  String s2="";
  Successful({Key key, this.s1,this.s2}): super(key:key);
  void main() => runApp(Successful());
  static const String _title = 'Booking Successful';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Booking Successful",
      theme: ThemeData(primaryColor: Colors.blue[600], accentColor: Colors.blueAccent),

      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        backgroundColor:Colors.white,
        body:
        //backgroundColor:Colors.grey[400],
          Center(child: Column(


            children: <Widget>[
              //SizedBox(height: 200.0,),
              SizedBox(height: 200.0),
            Center(child:Card(

                color: Colors.white,
                //elevation: 3.0,
                margin: EdgeInsets.only(left: 20,right: 20),
                child: ListTile(
                  contentPadding: EdgeInsets.fromLTRB(40, 15, 40, 15),
                  title: Center(child:Text('Booking Confirmed',style: TextStyle(fontSize:25.0,fontWeight: FontWeight.bold),)),

                  subtitle: Text('\n Your Booking for $s1, $s2 has been confirmed!',style: TextStyle(fontSize: 15.0),),
                  dense: false,
                  isThreeLine: true,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                )),
            )



            ],
        )
            ,)
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
