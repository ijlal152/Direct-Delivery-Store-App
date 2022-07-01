import 'package:flutter/material.dart';
import 'package:shop_system/main.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';


class RegisterNow extends StatelessWidget {
  const RegisterNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: RegisterAccount(),
    );
  }
}
class RegisterAccount extends StatefulWidget {
  const RegisterAccount({Key? key}) : super(key: key);

  @override
  State<RegisterAccount> createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {

  bool _isObscure = true;

  List<Step> stepList()=> [
    Step(state: _activeStepIndex<=0 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >=0,
        title: const Text('Step 1'),
        content: Container(
          child: Column(
            children: [
              TextField(
                controller: email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 8,),

              TextField(
                controller: pass,
                obscureText: _isObscure,
                decoration:  InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: (){
                      setState((){
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
    )),
    Step(state: _activeStepIndex<=1 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >=1,
        title: Text('Step 2'),
        content: Container(
          child: Column(
            children: [
              SizedBox(height: 8,),

              TextField(
                controller: fullName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Full name',
                ),
              ),
              SizedBox(height: 8,),

              TextField(
                controller: shopName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Shop name',
                ),
              ),

              SizedBox(height: 8,),

              InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber phoneNumber){
                    this.phoneNumber;
                  },
                onInputValidated: (bool value) {},
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                ignoreBlank: false,
                countrySelectorScrollControlled: true,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: TextStyle(color: Colors.black),
                textFieldController: phoneNumber,
                formatInput: false,
                maxLength: 15,
                keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                cursorColor: Colors.black,

              ),

              /*TextField(
                controller: phoneNumber,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone no',
                ),
              ),*/


              SizedBox(height: 8,),

              TextField(
                controller: currency,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Currency',
                ),
              ),

              SizedBox(height: 8,),

              TextField(
                controller: address,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                ),
              ),
            ],
          ),

    )),
    /*Step(state: StepState.complete,
        isActive: _activeStepIndex >=2,
        title: const Text('Confirm'),
        content:  Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Full name: ${fullName.text}', style: TextStyle(fontSize: 16),),
              Text('Email: ${email.text}', style: TextStyle(fontSize: 16),),
              Text('Shop name: ${shopName.text}', style: TextStyle(fontSize: 16),),
              Text('Phone no: ${phoneNumber.text}', style: TextStyle(fontSize: 16),),
              Text('Currency: ${currency.text}', style: TextStyle(fontSize: 16),),
              Text('Address: ${address.text}', style: TextStyle(fontSize: 16),),

              const SizedBox(height: 10,),
            ],
          ),
    ),
    ),*/
  ];


  int _activeStepIndex = 0;

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController shopName = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController currency = TextEditingController();
  TextEditingController address = TextEditingController();

  String phoneNoSelector = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Container(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                child: Stepper(
                  type: StepperType.horizontal,
                  currentStep: _activeStepIndex,
                  steps: stepList(),
                  onStepContinue: (){
                    if(_activeStepIndex < (stepList().length-1)){
                      _activeStepIndex +=1;
                    }
                    setState((){

                    });
                  },
                  onStepCancel: (){
                    if(_activeStepIndex == 0){
                      return;
                    }
                    _activeStepIndex-=1;
                    setState((){

                    });
                  },
                ),
              ),
              
              Positioned(
                top: 570,
                  child: ElevatedButton(onPressed: () {  }, child: Text('Register', style: TextStyle(
                    fontSize: 16,
                  ),
                  ),
                  ),

              ),

            ],
          ),
        ),


      ),
    );
  }
}
