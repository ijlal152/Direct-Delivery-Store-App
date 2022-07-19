import 'package:delivery_app/DbHelper.dart';
import 'package:delivery_app/HomePage.dart';
import 'package:delivery_app/Model/UserModel.dart';
import 'package:delivery_app/SignUpPage/SignupForm.dart';
import 'package:delivery_app/comHelper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  // shared preferences object
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  bool _isObscure = true;

  final formkey = GlobalKey<FormState>();
  final _uemail = TextEditingController();
  final _upassword = TextEditingController();

  var dbHelper;

  @override
  void initState(){
    super.initState();
    dbHelper = DbHelper();
  }

  login() async{
    String useremail = _uemail.text;
    String userpass = _upassword.text;
    // if(formkey.currentState!.validate()){
    //   await dbHelper.getLoginUser(useremail, userpass).then((UserData){
    //     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
    //         HomePageScreen()), (Route<dynamic> route) => false);
    //   }).catchError((error){
    //     print(error);
    //     alertDialog(context, "Error: Login failed");
    //   });
    // }
    await dbHelper.getLoginUser(useremail, userpass).then((UserData){
      if(UserData !=null){
        setSP(UserData).whenComplete((){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              HomePageScreen()), (Route<dynamic> route) => false);
        });
      }else{
        alertDialog(context, "Error: User not found");
      }
      // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
      //     HomePageScreen()), (Route<dynamic> route) => false);
    }).catchError((error){
      print(error);
      alertDialog(context, "Error: Login failed");
    });
    //await dbHelper.getLoginUser(useremail, userpass)
  }

  Future setSP(UserModel user) async{
    final SharedPreferences sp = await _pref;

    sp.setString("driver_shopname", user.D_ShopName!);
    //sp.setString("driver_shopname", user.D_Email!);
    //sp.setString("driver_shopname", user.D_Name!);
    //sp.setString("driver_shopname", user.D_Address!);
    //sp.setString("driver_shopname", shopname!);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Form(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30,),
                    const Text('Delivery App',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Image.asset('assets/images/truck.png', height: 150,),
                    const SizedBox(height: 15,),

                    const Text('Login here',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      margin: EdgeInsets.only(top: 10.0),
                      child: TextFormField(
                        controller: _uemail,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return alertDialog(context, 'Please enter email');
                          }
                          if(!validateEmail(value)){
                            return alertDialog(context, 'Please enter a valid email');
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Email',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      margin: EdgeInsets.only(top: 10.0),
                      child: TextFormField(
                        controller: _upassword,
                        obscureText: _isObscure,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return alertDialog(context, 'Please enter password');
                          }
                          return null;
                        },
                        decoration:  InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                                _isObscure ? Icons.visibility : Icons.visibility_off
                            ),
                            onPressed: (){
                              setState((){
                                _isObscure =! _isObscure;
                              });
                            },

                          ),
                          hintText: 'Password',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(30.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: ElevatedButton(
                        onPressed: (){login();},
                        child: const Text('Login'),
                      ),
                    ),

                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Does not have account?',
                          ),
                          TextButton(
                              onPressed: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_)=>SignupForm()));
                              },
                              child: const Text('Register account')
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
