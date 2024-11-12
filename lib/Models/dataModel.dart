class DataModel{
  List<dynamic> products;
  DataModel(this.products);
  factory DataModel.getData(Map<String,dynamic> products){
    return DataModel(products["data"]["products"]);
  }
}