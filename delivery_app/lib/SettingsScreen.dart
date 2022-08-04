import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool volNotify1 = true;
  bool volNotify2 = false;
  bool volNotify3 = false;

  File? _image;

  Future _imgFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this._image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  Future _imgFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this._image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }


  onChangeFunction1(bool newValue1){
    setState((){
      volNotify1 = newValue1;
    });
  }
  onChangeFunction2(bool newValue2){
    setState((){
      volNotify2 = newValue2;
    });
  }
  onChangeFunction3(bool newValue3){
    setState((){
      volNotify3 = newValue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Settings', style: TextStyle(fontFamily: 'Inter-Regular'),),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            
             actions: [
               Container(
                 margin: EdgeInsets.only(right: 10),
                   child: Icon(Icons.logout_outlined, color: Colors.black, size: 30,)
               ),
             ],
            
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(232, 235, 245, 1),
                    Color.fromRGBO(251, 252, 255, 1),
                  ]
              ),
            ),
            child: ListView(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: (){
                      _showPicker(context);
                    },

                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor:  Color(0xffFDCF09),
                      child: _image != null ? ClipOval(
                        child: Image.file(_image!, width: 100, height: 100,fit: BoxFit.cover),
                      )
                          : Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50)),
                        width: 100,
                        height: 100,
                        child: Icon(Icons.camera_alt, color: Colors.grey[800],),
                        ),
                      ),
                    ),
                  ),
                Divider(height: 15,),
                Center(
                  
                ),
    ],
            ),
          ),
        )
    );
  }
  
  Padding buildNotificationsOption(String title, bool value, Function onChangeMethod){
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600]
          ),),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
                activeColor: Colors.blue,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue){
                onChangeMethod(newValue);
              },
            ),
          )
        ],
      ),
    );
  }
  
  
  GestureDetector builAccountOption(BuildContext context, String title){
    return GestureDetector(
      onTap: (){
        showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Option 1'),
                Text('Option 2'),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: (){},
                  child: Text('Close')
              ),
            ],
          );
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]
            ),),
            Icon(Icons.arrow_forward, color: Colors.grey,)
          ],
        ),
      ),
    );
  }
}
