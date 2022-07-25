import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool volNotify1 = true;
  bool volNotify2 = false;
  bool volNotify3 = false;

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
          appBar: AppBar(
            title: Text('Settings', style: TextStyle(fontFamily: 'Inter-Regular'),),
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                SizedBox(height: 30,),
                Row(
                  children: [
                    Icon(Icons.person, color: Colors.blue,),
                    SizedBox(width: 10,),
                    Text('Account', style: TextStyle(fontFamily: 'Inter-Regular', fontWeight: FontWeight.bold),)
                  ],
                ),
                Divider(height: 20, thickness: 1,),
                SizedBox(height: 10,),
                builAccountOption(context, 'Change Password'),
                //builAccountOption(context, 'Content Settings'),
                //builAccountOption(context, 'Social'),
                builAccountOption(context, 'Language'),
                builAccountOption(context, 'Privacy and Security'),
                SizedBox(height: 40,),
                Row(
                  children: [
                    Icon(Icons.volume_up_outlined, color: Colors.blue,),
                    SizedBox(width: 10,),
                    Text('Notifications', style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                Divider(height: 20, thickness: 1,),
                SizedBox(height: 10,),
                buildNotificationsOption('Theme Dark', volNotify1, onChangeFunction1),
                //buildNotificationsOption('Account Active', volNotify2, onChangeFunction2),
                //buildNotificationsOption('Opportunity', volNotify3, onChangeFunction3),
                SizedBox(height: 30,),
                Center(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                    ), onPressed: (){},
                    child: Text('Sign Out', style: TextStyle(
                      fontFamily: 'Inter-Regular',
                      fontSize: 16,
                      letterSpacing: 2.2,
                      color: Colors.white,
                    ),),
                  ),
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
