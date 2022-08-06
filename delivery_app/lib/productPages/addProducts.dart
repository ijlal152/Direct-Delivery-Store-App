import 'package:country_code_picker/country_code_picker.dart';
import 'package:delivery_app/DbHelper.dart';
import 'package:delivery_app/Model/productModel.dart';
import 'package:delivery_app/comHelper.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({Key? key}) : super(key: key);

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {

  final formkey = GlobalKey<FormState>();

  TextEditingController prod_name = TextEditingController();
  TextEditingController prod_sku = TextEditingController();
  TextEditingController prod_purchaseprice = TextEditingController();
  TextEditingController prod_sellingprice = TextEditingController();
  TextEditingController prod_initqtyofunits = TextEditingController();
  TextEditingController prod_qtyperpkg = TextEditingController();
  TextEditingController prod_initqtyofpkgs = TextEditingController();

  var dbHelper;

  @override
  void initState(){
    super.initState();
    dbHelper = DbHelper();
  }

  AddNewProduct() async{
    if(prod_name.text.isEmpty){
      alertDialog(context, "Please enter prodcut name");
    }else if(prod_sku.text.isEmpty){
      alertDialog(context, "Please enter prodcut SKU");
    }else if(prod_purchaseprice.text.isEmpty){
      alertDialog(context, "Please enter purchase price");
    }else if(prod_sellingprice.text.isEmpty){
      alertDialog(context, "Please enter selling price");
    }else if(prod_initqtyofunits.text.isEmpty){
      alertDialog(context, "Enter Initial Quantity of units");
    }else if(prod_qtyperpkg.text.isEmpty){
      alertDialog(context, "Enter Quantity Per Package");
    }else if(prod_initqtyofpkgs.text.isEmpty){
      alertDialog(context, "Enter Quantity of Packages");
    }

    if(formkey.currentState!.validate()){
      formkey.currentState!.save();
      //clientLocation.text = widget.lat.toString() + widget.lng.toString();
      productModel pModel = productModel(prod_name.text, prod_sku.text, prod_purchaseprice.text, prod_sellingprice.text, prod_initqtyofunits.text, prod_qtyperpkg.text, prod_initqtyofpkgs.text);
      await dbHelper.saveProductData(pModel).then((product){
        alertDialog(context, "Product added");
      }).catchError((error){
        print(error);
        alertDialog(context, "Product added");
      });
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
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: const Text('Add Product', style: TextStyle(color: Colors.black, fontFamily: 'Inter-Regular'),),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black,),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 70,),
                  Container(
                    child: Image.asset('assets/images/products-icon2.png', height: 100,),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    margin: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      controller: prod_name,
                      style: TextStyle(
                          color: Color.fromRGBO(4, 12, 34, 1),
                          fontFamily: 'Inter-Regular',
                          fontSize: 17,
                          letterSpacing: -0.4000000059604645,
                          height: 1.411764705882353
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return alertDialog(context, 'Please enter name of product');
                        }
                        return null;
                      },
                      //onSaved: (val) => _email.text = val!,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Product name'
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    margin: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      controller: prod_sku,
                      style: TextStyle(
                          color: Color.fromRGBO(4, 12, 34, 1),
                          fontFamily: 'Inter-Regular',
                          fontSize: 17,
                          letterSpacing: -0.4000000059604645,
                          height: 1.411764705882353
                      ),
                      //controller: _email,
                      keyboardType: TextInputType.text,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return alertDialog(context, 'Please enter product SKU');
                        }
                        return null;
                      },
                      //onSaved: (val) => _email.text = val!,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        labelText: 'Product SKU',
                        fillColor: Colors.white,
                        filled: true,
                        suffixIcon: Icon(Icons.qr_code),
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          //padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          //margin: const EdgeInsets.only(top: 10.0),
                          width: 150,
                          child: TextFormField(
                            controller: prod_purchaseprice,
                            style: TextStyle(
                                color: Color.fromRGBO(4, 12, 34, 1),
                                fontFamily: 'Inter-Regular',
                                fontSize: 17,
                                letterSpacing: -0.4000000059604645,
                                height: 1.411764705882353
                            ),
                            //controller: _email,
                            keyboardType: TextInputType.number,
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return alertDialog(context, 'Please enter purchase price');
                              }
                              return null;
                            },
                            //onSaved: (val) => _email.text = val!,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              labelText: 'Purchase Price',
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                        ),

                        Container(
                          //padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          //margin: const EdgeInsets.only(top: 10.0),
                          width: 150,
                          child: TextFormField(
                            controller: prod_sellingprice,
                            style: TextStyle(
                                color: Color.fromRGBO(4, 12, 34, 1),
                                fontFamily: 'Inter-Regular',
                                fontSize: 17,
                                letterSpacing: -0.4000000059604645,
                                height: 1.411764705882353
                            ),
                            //controller: _email,
                            keyboardType: TextInputType.number,
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return alertDialog(context, 'Please enter selling price');
                              }
                              return null;
                            },
                            //onSaved: (val) => _email.text = val!,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              labelText: 'Selling Price',
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    margin: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      controller: prod_initqtyofunits,
                      style: TextStyle(
                          color: Color.fromRGBO(4, 12, 34, 1),
                          fontFamily: 'Inter-Regular',
                          fontSize: 17,
                          letterSpacing: -0.4000000059604645,
                          height: 1.411764705882353
                      ),
                      //controller: _email,
                      keyboardType: TextInputType.number,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return alertDialog(context, 'Please enter initial quantity of units');
                        }
                        return null;
                      },
                      //onSaved: (val) => _email.text = val!,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        //suffixIcon: Icon(Icons.my_location),
                        labelText: 'Initial Quantity of units',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    margin: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      controller: prod_qtyperpkg,
                      style: TextStyle(
                          color: Color.fromRGBO(4, 12, 34, 1),
                          fontFamily: 'Inter-Regular',
                          fontSize: 17,
                          letterSpacing: -0.4000000059604645,
                          height: 1.411764705882353
                      ),
                      //controller: _email,
                      keyboardType: TextInputType.number,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return alertDialog(context, 'Please enter initial quantity of units');
                        }
                        return null;
                      },
                      //onSaved: (val) => _email.text = val!,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        //suffixIcon: Icon(Icons.my_location),
                        labelText: 'Quantity per Package',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    margin: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      controller: prod_initqtyofpkgs,
                      style: TextStyle(
                          color: Color.fromRGBO(4, 12, 34, 1),
                          fontFamily: 'Inter-Regular',
                          fontSize: 17,
                          letterSpacing: -0.4000000059604645,
                          height: 1.411764705882353
                      ),
                      //controller: _email,
                      keyboardType: TextInputType.number,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return alertDialog(context, 'Please enter initial quantity of packages');
                        }
                        return null;
                      },
                      //onSaved: (val) => _email.text = val!,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        //suffixIcon: Icon(Icons.my_location),
                        labelText: 'Initial Quantity of Packages',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  //SizedBox(height: 130,),

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
                              fontFamily: 'Gilroy-Regular',
                            )
                        ),
                        onPressed: (){
                          AddNewProduct();
                        },
                        child: const Text('Add Product',
                          style: TextStyle(
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
    );
  }
}
