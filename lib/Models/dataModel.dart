class DataModel{
  List<dynamic> products;
  DataModel(this.products);
  factory DataModel.getData(Map<String,dynamic> products){
    return DataModel(List<dynamic>.from(products["data"]["products"]));
  }
}