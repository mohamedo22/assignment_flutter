import 'package:assignment/Providers/authProvider.dart';
import 'package:assignment/Screens/signUpPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});
  TextEditingController emailTxt = TextEditingController();
  TextEditingController passwordTxt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
            child: Text(
          "Login",
          style: TextStyle(
              foreground: Paint()..color = Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        )),
      ),
      body: Center(
        child: Consumer<AuthProvider>(
          builder: (context, providerObject, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.black),
                        borderRadius: BorderRadius.circular(100)),
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Image.asset(
                        "images/shopping-cart.png",
                        width: 100,
                      ),
                    )),
                SizedBox(
                  height: 60,
                ),
                SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: emailTxt,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), label: Text("Email")),
                    )),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: passwordTxt,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), label: Text("Password")),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    providerObject.signIn(emailTxt.text, passwordTxt.text, context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          foreground: Paint()..color = Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                    backgroundColor: WidgetStatePropertyAll(Colors.black),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account ?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Signuppage(),
                              ));
                        },
                        child: Text("Register"))
                  ],
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
