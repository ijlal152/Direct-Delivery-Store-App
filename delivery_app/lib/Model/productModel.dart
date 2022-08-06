class productModel{
  String? product_name;
  String? product_sku;
  String? product_price;
  String? product_sellingprice;
  String? product_initqtyofunits;
  String? product_qtyperpkg;
  String? product_initqtyofpkg;

  productModel(this.product_name, this.product_sku, this.product_price, this.product_sellingprice, this.product_initqtyofunits, this.product_qtyperpkg, this.product_initqtyofpkg);

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      'product_name': product_name,
      'product_sku': product_sku,
      'product_price': product_price,
      'product_sellingprice' : product_sellingprice,
      'product_InitialQuantityOfUnits': product_initqtyofunits,
      'product_QuantityPerPackage' : product_qtyperpkg,
      'product_InitialQuantityPerPackage': product_qtyperpkg
    };
    return map;
  }

  productModel.fromMap(Map<String, dynamic> map){
    product_name = map['product_name'];
    product_sku = map['product_sku'];
    product_price = map['product_price'];
    product_sellingprice = map['product_sellingprice'];
    product_initqtyofunits = map['product_InitialQuantityOfUnits'];
    product_qtyperpkg = map['product_QuantityPerPackage'];
    product_initqtyofpkg = map['product_InitialQuantityPerPackage'];
  }
}