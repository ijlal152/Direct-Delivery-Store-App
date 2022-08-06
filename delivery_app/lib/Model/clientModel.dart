class clientModel{
  String? c_name;
  String? c_phonecountrycode;
  String? c_phoneno;
  String? c_fullphoneno;
  String? c_gpsLocation;
  String? c_initialBalance;

  clientModel(this.c_name, this.c_phonecountrycode, this.c_phoneno, this.c_fullphoneno ,this.c_gpsLocation, this.c_initialBalance);

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      'client_name': c_name,
      'client_countrycode': c_phonecountrycode,
      'client_phoneno': c_phoneno,
      'client_fullphoneno' : c_fullphoneno,
      'client_gpslocation': c_gpsLocation,
      'client_initialbalance' : c_initialBalance,
    };
    return map;
  }

  clientModel.fromMap(Map<String, dynamic> map){
    c_name = map['client_name'];
    c_phonecountrycode = map['client_countrycode'];
    c_phoneno = map['client_phoneno'];
    c_fullphoneno = map['client_phoneno'];
    c_gpsLocation = map['client_gpslocation'];
    c_initialBalance = map['client_initialbalance'];
  }

}