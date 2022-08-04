import 'dart:io' as io;
import 'package:delivery_app/Model/UserModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DbHelper{

  static Database? _db;

  static const String DB_Name = 'test.db';
  static const int Version = 1;
  static const String Table_User = 'User';
  static const String D_Name = 'driver_name';
  static const String D_Email = 'driver_email';
  static const String D_Password = 'driver_password';
  static const String D_ShopName = 'driver_shopname';
  static const String D_Phoneno = 'driver_phoneno';
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

  _onCreate(Database db, int intVersion) async{
    await db.execute("CREATE TABLE User(ID INTEGER PRIMARY KEY, driver_name TEXT, driver_email TEXT, driver_password TEXT, driver_shopname TEXT, driver_phoneno TEXT, driver_address TEXT)");
  }

  Future<UserModel> saveData(UserModel user, String useremail) async{
    var dbClient = await db;
    //user.D_Name = (await dbClient!.insert(Table_User, user.toMap())) as String;
    var res = await dbClient!.rawQuery("SELECT * FROM User WHERE "
        "$D_Email = '$useremail'");
    if(res.isNotEmpty){
      //alertDialog(context, "User already exists");
      print("User already exists");
    }else{
      user.D_Email = (await dbClient.insert(Table_User, user.toMap())) as String;
    }
    return user;
  }

  Future<UserModel> getLoginUser(String useremail, String userpassword) async{
    var dbClient = await db;
    var res = await dbClient!.rawQuery("SELECT * FROM User WHERE "
        "$D_Email = '$useremail' AND "
        "$D_Password = '$userpassword'");
    if(res.isNotEmpty){
      //return UserModel.fromMap(res.first);
      return UserModel.fromMap(res.first);
    }
    return UserModel.fromMap(res.first);;
  }
}