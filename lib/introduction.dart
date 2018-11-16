import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
class IntroductionlistPage extends StatefulWidget {

  @override createState() => Introduction_listState();
}
class Introduction_listState extends State {
  var imgBytes = null;
  @override void initState() {
    super.initState();
    var url = 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542109726573&di=992e87f4e836caf703510eb84e8cfda6&imgtype=0&src=http%3A%2F%2Fimg.mp.sohu.com%2Fq_mini%2Cc_zoom%2Cw_640%2Fupload%2F20170618%2Ff925e6b4bdcf463092637ce5d0ca316a_th.jpg';
    http.get(url).then((response) {
      print('download complete!');
      setState(() => imgBytes = response.bodyBytes);
    });
  }
  @override
  Widget build(BuildContext context) {
    var childWidgets = <Widget>[];
    childWidgets.add(Text(' Information Technology Management \n ', style: TextStyle(fontSize: 26.0, fontFamily:
    'marker felt'), textAlign: TextAlign.center,),);
    if (imgBytes != null)
      childWidgets.add(Image.memory(imgBytes,
          width: MediaQuery.of(context).size.width - 120)


      );
    childWidgets.add(Text('\n Core Courses ', style: TextStyle(fontSize: 40.0,fontFamily: 'marker felt'),),);
    childWidgets.add(Text('\n 1、Internet Computing and Programming '
        '\n \n 2、Foundations of Management in the IT Context'
        '\n \n 3、Principles and Practices of Data Analytics '
        '\n \n 4、IT Project Skills'
        '\n \n 5、IT Forum', style: TextStyle(fontSize: 16.0),),);

    childWidgets.add(Text('\n Elective Courses ', style: TextStyle(fontSize: 40.0,fontFamily: 'marker felt'),),);
    childWidgets.add(Text('\n \n Stream 1 - IT Enterprise Management '
        '\n \n Stream 2 - Knowledge and Information Management '
        '\n \n Stream 3 - Internet and Web Technologies'
        '\n \n Stream 4 - Business Analytics'
        '\n \n MSc Project & Research', style: TextStyle(fontSize: 16.0),),);




    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text('Introduction',style:TextStyle(fontSize: 35.0,color:Colors.black,
            fontFamily: 'marker felt')),

      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          Column(
            children: childWidgets,
          ),
        ],
      ),
    );
  }
}