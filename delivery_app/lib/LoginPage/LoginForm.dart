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
      //print(error);
      alertDialog(context, "Error: Login failed");
    });
    //await dbHelper.getLoginUser(useremail, userpass)
  }

  Future setSP(UserModel user) async{
    final SharedPreferences sp = await _pref;

    sp.setString("driver_shopname", user.D_ShopName!);
    sp.setString("driver_email", user.D_Email!);
    sp.setString("driver_name", user.D_Name!);
    sp.setString("driver_address", user.D_Address!);
    sp.setString("driver_countrycode", user.D_phonecountrycode!);
    sp.setString("driver_phoneno", user.D_Phoneno!);
    sp.setString("driver_fullphoneno", user.D_fullphoneno!);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
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
          child: Form(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 50,),
                      Image.asset('assets/images/truck.png', height: 150,),
                      const SizedBox(height: 15,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: const EdgeInsetsDirectional.only(start: 25),
                          child: const Text('Sign In',
                            style: TextStyle(
                                color: Color.fromRGBO(4, 12, 34, 1),
                                fontFamily: 'Inter-Bold',
                                fontSize: 32,
                                letterSpacing: -0.23999999463558197,
                                fontWeight: FontWeight.normal,
                                height: 1.1875
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        margin: EdgeInsets.only(top: 10.0),
                        child: TextFormField(
                          style: TextStyle(
                              color: Color.fromRGBO(4, 12, 34, 1),
                              fontFamily: 'Inter-Regular',
                              fontSize: 17,
                              letterSpacing: -0.4000000059604645,
                              height: 1.411764705882353
                          ),
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
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                          style: TextStyle(
                              color: Color.fromRGBO(4, 12, 34, 1),
                              fontFamily: 'Inter-Regular',
                              fontSize: 17,
                              letterSpacing: -0.4000000059604645,
                              height: 1.411764705882353
                          ),
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
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontFamily: 'Inter-SemiBold',
                                fontSize: 15,
                                letterSpacing: -0.20000000298023224,
                                height: 1.4666666666666666,
                                fontWeight: FontWeight.normal,
                                color: Color.fromRGBO(0, 147, 185, 1),
                              ),
                            ),
                            TextButton(
                                onPressed: (){

                                },
                                child: const Text('Click here',
                                  style: TextStyle(
                                    fontFamily: 'Inter-SemiBold',
                                    fontSize: 15,
                                    letterSpacing: -0.20000000298023224,
                                    height: 1.4666666666666666,
                                    fontWeight: FontWeight.normal,
                                    color: Color.fromRGBO(0, 147, 185, 1),
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 100,),

                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account ? ",
                              style: TextStyle(
                                fontFamily: 'Inter-SemiBold',
                                fontSize: 15,
                                letterSpacing: -0.20000000298023224,
                                height: 1.4666666666666666,
                                fontWeight: FontWeight.normal,
                                color: Color.fromRGBO(0, 147, 185, 1),
                              ),
                            ),
                            TextButton(
                              onPressed: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_)=>SignupForm()));
                              },
                              child: const Text('Sign Up here',
                                style: TextStyle(
                                  fontFamily: 'Inter-SemiBold',
                                  fontSize: 15,
                                  letterSpacing: -0.20000000298023224,
                                  height: 1.4666666666666666,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(0, 147, 185, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                          height: 56,
                          margin: EdgeInsets.all(30.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: ElevatedButton(
                            style:  ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(43, 136, 216, 1),
                                textStyle: TextStyle(
                                  fontFamily: 'Inter-Regular',
                                  letterSpacing: -0.4000000059604645,
                                )
                            ),
                            onPressed: (){
                              //checkif_fields_are_empty();
                              login();
                            },
                            child: const Text('Sign In',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
