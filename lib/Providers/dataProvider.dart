import 'package:assignment/Models/dataModel.dart';
import 'package:assignment/Services/dataServides.dart';
import 'package:flutter/cupertino.dart';

class DataProvider with ChangeNotifier{
  DataModel? products;
  Future<void> fetchingProducts() async{
    products = await DataService().fetchingData();
    notifyListeners();
  }
}