import 'package:assignment/Models/dataModel.dart';
import 'package:dio/dio.dart';

class DataService{
  Dio dio = new Dio();
  Future<DataModel> fetchingData() async{
    try{
      var response = await dio.get("https://student.valuxapps.com/api/home");
      if(response.statusCode == 200)
        {
          return DataModel.getData(response.data);
        }
      else{
          return new Future.error("Error StateusCode : ${response.statusCode}");
        }
    }
    catch(e){
      return new Future.error("Error Fetching : ${e}");
    }
  }
}