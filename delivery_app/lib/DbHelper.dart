import 'dart:io' as io;
import 'package:delivery_app/Model/UserModel.dart';
import 'package:delivery_app/Model/clientModel.dart';
import 'package:delivery_app/Model/productModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DbHelper{

  static Database? _db;

  static const String DB_Name = 'Driver.db';
  static const int Version = 1;
  static const String Table_User = 'Driver_Table';
  static const String client_Table = 'Client_Table';
  static const String product_Table = 'Product_Table';
  static const String D_Name = 'driver_name';
  static const String D_Email = 'driver_email';
  static const String client_name = 'client_name';
  static const String D_Password = 'driver_password';
  static const String D_ShopName = 'driver_shopname';
  static const String D_phonecountrycode = 'driver_countrycode';
  static const String D_Phoneno = 'driver_phoneno';
  static const String D_Fullphoneno = 'driver_fullphoneno';
  static const String D_Address = 'driver_address';

  Future<Database?> get db async{
    if(_db != null){
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  initDb() async{
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: Version, onCreate:_onCreate);
    return db;
  }

  // _onCreate(Database db, int intVersion) async{
  //   await db.execute("CREATE TABLE User(ID INTEGER PRIMARY KEY, driver_name TEXT, driver_email TEXT, driver_password TEXT, driver_shopname TEXT, driver_phoneno TEXT, driver_address TEXT)");
  // }

  _onCreate(Database db, int intVersion) async{
    await db.execute("CREATE TABLE Driver_Table(ID INTEGER PRIMARY KEY, driver_name TEXT, driver_email TEXT, driver_password TEXT, driver_shopname TEXT, driver_countrycode TEXT, driver_phoneno TEXT, driver_fullphoneno TEXT, driver_address TEXT)");
    await db.execute("CREATE TABLE Client_Table(ID INTEGER PRIMARY KEY, client_name TEXT, client_countrycode TEXT, client_phoneno TEXT, client_fullphoneno TEXT, client_gpslocation TEXT, client_initialbalance TEXT)");
    await db.execute("CREATE TABLE Product_Table(ID INTEGER PRIMARY KEY, product_name TEXT, product_sku TEXT, product_price INTEGER, product_sellingprice INTEGER, product_InitialQuantityOfUnits INTEGER, product_QuantityPerPackage INTEGER, product_InitialQuantityPerPackage INTEGER )");
  }

  Future<UserModel> saveData(UserModel user, String useremail) async{
    var dbClient = await db;
    //user.D_Name = (await dbClient!.insert(Table_User, user.toMap())) as String;
    var res = await dbClient!.rawQuery("SELECT * FROM Driver_Table WHERE "
        "$D_Email = '$useremail'");
    if(res.isNotEmpty){
      //alertDialog(context, "User already exists");
      print("User already exists");
    }else{
      user.D_Email = (await dbClient.insert(Table_User, user.toMap())) as String;
    }
    return user;
  }

  Future<clientModel> saveClientData(clientModel client) async{
    var dbClientData = await db;
    client.c_name = (await dbClientData!.insert(client_Table, client.toMap())) as String;
    return client;
  }

  Future<productModel> saveProductData(productModel product) async{
    var dbClientData = await db;
    product.product_name = (await dbClientData!.insert(product_Table, product.toMap())) as String;
    return product;
  }

  Future<UserModel?> getLoginUser(String useremail, String userpassword) async{
    var dbClient = await db;
    var res = await dbClient!.rawQuery("SELECT * FROM Driver_Table WHERE "
        "$D_Email = '$useremail' AND "
        "$D_Password = '$userpassword'");
    if(res.isNotEmpty){
      //return UserModel.fromMap(res.first);
      return UserModel.fromMap(res.first);
    }
    return null;
  }

  // Future<clientModel?> getClientData() async{
  //   var dbClient = await db;
  //   var res = await dbClient!.rawQuery("SELECT * FROM Client_Table");
  //   if(res.isNotEmpty){
  //     return clientModel.fromMap(res.first);
  //   }
  //   return null;
  // }

  Future<List<Map<String, Object?>>> retrieveClientData() async {
    var dbClient = await db;
    //List<Map<String, Object?>> queryResult = await dbClient!.query('Client_Table');
    var queryResult = await dbClient!.query('Client_Table');
    return queryResult;
    //return queryResult.map((e) => clientModel.fromMap(e)).toList();
    //return (queryResult as List).map((e) => clientModel.fromMap(e)).toList();
  }

}