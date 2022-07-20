import 'package:delivery_app/LoginPage/LoginForm.dart';
import 'package:delivery_app/SignUpPage/SignupFormTwo.dart';
import 'package:delivery_app/comHelper.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {

  bool _isObscure = true;

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  checkif_fields_are_empty(){
    if(_email.text.isEmpty){
      alertDialog(context, "Please enter email");
    }else if(_password.text.isEmpty){
      alertDialog(context, "Please enter password");
    }else{
      Navigator.push(context,
          MaterialPageRoute(builder: (context)=>SignupFormTwo(email: _email.text, password: _password.text)));
    }
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            Container(
              width: 80,
              margin: const EdgeInsetsDirectional.only(end: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(child: Text('Step 1 of 2',
                style: TextStyle(
                  fontFamily: 'Gilroy-Regular',
                ),
              )),
            ),
          ],
        ),
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
                        const SizedBox(height: 80,),
                        Image.asset('assets/images/driver.png', height: 110,),
                        const SizedBox(height: 25,),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: const EdgeInsetsDirectional.only(start: 25),
                            child: const Text('Sign Up',
                              style: TextStyle(
                                fontFamily: 'Gilroy-Bold',
                                color: Colors.black,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),

                        Container(
                            margin: const EdgeInsetsDirectional.only(start: 22, end: 22),
                            child: const Text('We ask for your information to keep your data '
                                'safe and secure',
                            style: TextStyle(
                              fontFamily: 'Gilroy-Regular',
                              color: Colors.black,
                            ),)
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          margin: const EdgeInsets.only(top: 10.0),
                          child: TextFormField(
                            controller: _email,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return alertDialog(context, 'Please enter email');
                              }
                              if(!validateEmail(value)){
                                return alertDialog(context, 'Please enter a valid email');
                              }
                              return null;
                            },
                            onSaved: (val) => _email.text = val!,
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
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          margin: const EdgeInsets.only(top: 10.0),
                          child: TextFormField(
                            controller: _password,
                            obscureText: _isObscure,
                            decoration:  InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              prefixIcon: const Icon(Icons.lock),
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
                                'Already have an account ? ',
                                style: TextStyle(
                                  fontFamily: 'Gilroy-Regular',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 147, 185, 1),
                                ),
                              ),
                              TextButton(
                                  onPressed: (){
                                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                        const LoginForm()), (Route<dynamic> route) => false);
                                  },
                                  child: const Text('Sign In here',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy-Regular',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(0, 147, 185, 1),
                                    ),
                                  ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                            margin: const EdgeInsetsDirectional.only(start: 22, end: 22),
                            child:  Text.rich(
                              style: TextStyle(
                                fontSize: 14,
                              ),
                              TextSpan(
                                text: 'By using our mobile app, you agree to our ',
                                style: TextStyle(
                                  fontFamily: 'Gilroy-Regular',
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Term of Use',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                    )
                                  ),
                                  TextSpan(text: ' and '),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                      )
                                  ),
                                ]
                              ),
                            ),
                        ),

                        Container(
                          // rgba(43, 136, 216, 1)
                          height: 56,
                            margin: EdgeInsets.all(30.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              //color: Color.fromRGBO(43, 136, 216, 1),
                              //color: Color.fromRGBO(232, 235, 238, 1),
                              //color: Color.fromRGBO(43, 136, 216, 1),


                            ),
                            child: ElevatedButton(
                              style:  ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(43, 136, 216, 1),
                                textStyle: TextStyle(
                                  fontFamily: 'Gilroy-Regular',
                                )
                              ),
                              onPressed: (){
                                checkif_fields_are_empty();
                              },
                              child: const Text('Continue',
                                style: TextStyle(
                                  //fontFamily: 'Gilroy-Regular',
                                  fontSize: 21,
                                  color: Colors.white,
                                  //fontWeight: FontWeight.bold,
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
