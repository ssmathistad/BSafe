// FirstScreen.dart -- Samantha

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:BSafe/main.dart';
import 'package:BSafe/SecondScreen.dart';
import 'package:BSafe/ThirdScreen.dart';
import 'package:BSafe/FourthScreen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timers"),
      ),
      
      body: MyHomePage(title: 'BSafe'),
      
      drawer: Drawer(
        child: ListView(  
          children: <Widget>[ 
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },              
            ),
            ListTile(
              leading: Icon(Icons.map),
              title: Text("Map"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdScreen()),
                );
              },              
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text("Contacts"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },              
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text("Messaging"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FourthScreen()),
                );
              },              
            ),
          ]
        )
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  Position pos;
  String lat = "1st";
  String long = "2nd";

  //*** Asynchronous function that gets your geoposition and stores it into lat and long variables
  Future<Position>  getPos() async {
    pos = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    lat = pos.latitude.toString();
    long = pos.longitude.toString();

    return pos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Samantha\'s Page: Your geolocation is:',
            ),
            Text(
              'Lat: $lat \nLong: $long',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              'You\'ve requested your location $counter times.',
            ),
          ],
        ),
      ),
      //
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      //
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          getPos();
          counter++;
        }),
        tooltip: 'Geolocation',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, //*** Centers the action button to the bottom-center
    );
  }
}
