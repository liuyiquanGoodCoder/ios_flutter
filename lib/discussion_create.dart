import 'global.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DiscussionCreationPage extends StatefulWidget {
  @override createState() => NotificationCreationState();
}

class NotificationCreationState extends State {

  var images = [];
  var discussion = "Discussion";
  var title = '';
  var content = '';

  void attach(source) {
    ImagePicker.pickImage(source: source).then((file){
      if (file != null)
        setState(() => images.add(file));
    });
  }



  @override
  Widget build(BuildContext context) {
//
//    var items = <DropdownMenuItem>[];
//
//        items.add(DropdownMenuItem(value: "male", child: Text("male")));
//        items.add(DropdownMenuItem(value: "female", child: Text("female")));
//
//    var ddButton = DropdownButton(
//      value: gender,
//      items: items,
//      onChanged: (course) => setState(() => gender = course),
//    );


    var widgets = <Widget>[
      Text('Post to'),
      //ddButton,
      TextField(
        decoration: InputDecoration(hintText: 'Title',),
        onChanged: (text) => setState(() => title = text),
      ),
      Divider(color: Colors.transparent,),
      TextField(
        decoration: InputDecoration(hintText: 'Content',),
        keyboardType: TextInputType.multiline,
        maxLines: null,
        onChanged: (text) => setState(() => content = text),
      ),
    ];

    var width = MediaQuery.of(context).size.width - 120;

    for (var f in images) {
      widgets.add(Divider(color: Colors.transparent,));
      widgets.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.file(f, width: width),
              IconButton(icon: Icon(Icons.cancel), iconSize: 32.0,
                onPressed: () => setState(() => images.remove(f)),
              )
            ],
          )
      );
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('Add Discussion'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () => attach(ImageSource.camera),
          ),
          IconButton(
            icon: Icon(Icons.photo),
            onPressed: () => attach(ImageSource.gallery),
          ),


          IconButton(icon: Icon(Icons.send), onPressed: () => post(),),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[Column(children: widgets)],
      ),
    );




  }

  void post() {
    var ref = dbRef.child('Discussion/$discussion/notifications').push();
    ref.set({
      'key' : ref.key,
     // 'gender' : gender,
      'title' : title,
      'content' : content,
      'createdAt' : DateTime.now().millisecondsSinceEpoch,
      'createdBy' : userID,
      'discussion':discussion,
    });

    for (var i=0; i < images.length; i++) {
      var fRef = storageRef.child(ref.key + '/$i');
      var task = fRef.putFile(images[i]);
      task.future.then((snapshot) =>
          ref.child('images/$i').set(snapshot.downloadUrl.toString())
      );
    }



    Navigator.pop(context);
  }



}