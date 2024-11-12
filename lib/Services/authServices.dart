import 'package:dio/dio.dart';

class authService {
  Dio dio = new Dio();

  Future<bool> signIn(email, password) async {
    try {
      var response = await dio.post(
        "https://student.valuxapps.com/api/login",
        data: {"email": email, "password": password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        if(response.data["status"]==true){
          return true;
        }
        else{
          print("not valid user");
          return false;
        }
      } else {
        print("Failed to sign in: ${response.statusCode} ${response.statusMessage}");
        return false;
      }
    } catch (e) {
      print("Error during signIn: $e");
      return false;
    }
  }

  Future<bool> signUp(name, phone, email, password) async {
    try {
      var response = await dio.post(
        "https://student.valuxapps.com/api/register",
        data: {
          "name": name,
          "phone": phone,
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        if(response.data["status"]==true) {
            return true;
        }
        else{
          print("error at ${response.data["message"]}");
          return false;
        }
      } else {
        print("Failed to sign up: ${response.statusCode} ${response.statusMessage}");
        return false;
      }
    } catch (e) {
      print("Error during signUp: $e");
      return false;
    }
  }
}
