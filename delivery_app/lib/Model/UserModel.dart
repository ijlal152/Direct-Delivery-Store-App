class UserModel{
  String? D_Email;
  String? D_Password;
  String? D_Name;
  String? D_ShopName;
  String? D_Phoneno;
  String? D_Address;

  UserModel(this.D_Email, this.D_Password, this.D_Name, this.D_ShopName, this.D_Phoneno, this.D_Address);

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      'driver_name': D_Name,
      'driver_email': D_Email,
      'driver_password': D_Password,
      'driver_shopname': D_ShopName,
      'driver_phoneno': D_Phoneno,
      'driver_address': D_Address,
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map){
    D_Name = map['driver_name'];
    D_Email = map['driver_email'];
    D_Password = map['driver_password'];
    D_ShopName = map['driver_shopname'];
    D_Phoneno = map['driver_phoneno'];
    D_Address = map['driver_address'];
  }

}