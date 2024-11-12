import 'package:assignment/Screens/HomePage.dart';
import 'package:assignment/Services/authServices.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier
{
  Future<void> signIn(email , password , context) async{
    try{
      await authService().signIn(email, password).then((state) {
        if (state == true) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage(),));
        }
      }).onError(
        (error, stackTrace) { print("error signin : $error");}
      );
    }
    catch(e){
      print("error : $e");
    }
    notifyListeners();
  }
  Future<void> signUp(name , phone , email , password , context) async{
    if(name !=null && phone!=null && email!=null&&password!=null){
    try{
      await authService().signUp(name, phone, email, password).then((state){
        if(state == true)
          {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage(),));
          }
      }).onError(
              (error, stackTrace) { print("error : $error");}
      );
    }
    catch(e)
    {
      print("error signup: $e");
    }}
    else{
      print("Check nullable fields");
    }
    notifyListeners();
  }
}