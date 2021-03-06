import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'global.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() {
    return HomeState();
  }
}
class HomeState extends State {


  @override
  Widget build(BuildContext context) {
    if (userID != null)
      return menuScreen();
    else
      return splashScreen();
  }


  Widget splashScreen() {
    var title = 'Reach';
    var content = '\n\nenjoy your study ^ ^!\n\n';
    return Scaffold(
      backgroundColor: Colors.amberAccent,
        appBar: null,
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(title, style: TextStyle(fontSize: 66.0, fontFamily:
              'Marker Felt'), textAlign: TextAlign.center,),

              Text(content, style: TextStyle(fontSize: 20.0, fontFamily:
              'krungthep'), textAlign: TextAlign.center,),
              IconButton(
                icon: Icon(Icons.import_contacts),
                iconSize: 128.0,
                  onPressed: () => signIn(context).then((success){
                    if (success) setState((){});
                  }),              ),
            ],
          ),
        )
    );
  }
  Widget menuScreen() {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text('Reach',style:TextStyle(fontSize: 35.0,color:Colors.black,
            fontFamily: 'marker felt')),

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            color:Colors.black,
            onPressed: (){
              signOut();
              setState((){});
            },          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          FlatButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.notifications, size: 48.0, color: Colors.white,),

                Text('Notification',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),

              ],
            ),
            color: Colors.redAccent,
            onPressed:
                () => Navigator.pushNamed(context, '/notificationList'),
          ),

          FlatButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.people, size: 48.0, color: Colors.white,),

                Text('Discussion\nGroups',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),

              ],
            ),
            color: Colors.pink ,
            onPressed: () =>  Navigator.pushNamed(context, '/discussion'),
          ),
          FlatButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.account_balance, size: 48.0, color: Colors.white,),

                Text('Introduction',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),

              ],
            ),
            color: Colors.deepOrange ,
            onPressed:
                () => Navigator.pushNamed(context, '/introduction'),
          ),

          FlatButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.chat, size: 48.0, color: Colors.white,),

                Text('Personal',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),

              ],
            ),
            color: Colors.orange,
            onPressed:
                () => Navigator.pushNamed(context, '/personalList'),
          ),


        ], // <Widget>[]
      ), // GridView.count
    ); // Scaffold
  } // end of the menuScreen() method
  }
