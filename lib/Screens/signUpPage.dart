import 'package:assignment/Providers/authProvider.dart';
import 'package:assignment/Screens/loginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Signuppage extends StatelessWidget {
  Signuppage({super.key});
  TextEditingController emailTxt = TextEditingController();
  TextEditingController phoneTxt = TextEditingController();
  TextEditingController nameTxt = TextEditingController();
  TextEditingController passwordTxt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
            child: Text(
              "Signup",
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
                SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: nameTxt,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), label: Text("Your Name")),
                    )),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: phoneTxt,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), label: Text("Phone")),
                    )),
                SizedBox(
                  height: 10,
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
                    providerObject.signUp(nameTxt.text, phoneTxt.text, emailTxt.text, passwordTxt.text, context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      "Signup",
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
                    Text("Already have an account ?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Loginpage(),
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
