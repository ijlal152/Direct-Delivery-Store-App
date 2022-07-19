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
    return Scaffold(

      body: Container(
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
                      const SizedBox(height: 50,),

                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 80,
                          margin: const EdgeInsetsDirectional.only(end: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(child: Text('Step 1 of 2')),
                        ),
                      ),

                      const SizedBox(height: 30,),

                      Image.asset('assets/images/driver.png', height: 110,),
                      const SizedBox(height: 25,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: const EdgeInsetsDirectional.only(start: 25),
                          child: const Text('Sign Up',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      Container(
                          margin: const EdgeInsetsDirectional.only(start: 22, end: 22),
                          child: const Text('We ask for your information to keep your data '
                              'safe and secure',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
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
                                fontSize: 15,
                              ),
                            ),
                            TextButton(
                                onPressed: (){
                                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                      const LoginForm()), (Route<dynamic> route) => false);
                                },
                                child: const Text('Login here',
                                  style: TextStyle(
                                    fontSize: 15,
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
                          margin: EdgeInsets.all(30.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: ElevatedButton(
                            style:  ButtonStyle(

                            ),
                            onPressed: (){
                              checkif_fields_are_empty();
                            },
                            child: const Text('Continue',
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
    );
  }
}
