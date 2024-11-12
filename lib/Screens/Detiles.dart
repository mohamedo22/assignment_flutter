import 'package:assignment/Providers/dataProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Detiles extends StatelessWidget {
  int id;
  Detiles({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back)),
            Center(
              child: Text(
                "Product Details",
                style: TextStyle(
                    foreground: Paint()..color = Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Consumer<DataProvider>(
          builder: (context, providerObject, child) {
           return SingleChildScrollView(
             child: Column(
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.network(providerObject.products!.products[id]["image"],) ,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(providerObject.products!.products[id]["name"],style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13),
                    child: Text(providerObject.products!.products[id]["description"]),//sees
                  )
                ],
              ),
           );
          } 
        ),
      ),
    );
  }
}
