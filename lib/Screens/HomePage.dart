import 'package:assignment/Providers/dataProvider.dart';
import 'package:assignment/Screens/Detiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../costumWidgets/customCard.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
            child: Text(
          "Products",
          style: TextStyle(
              foreground: Paint()..color = Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        )),
      ),
      body: Consumer<DataProvider>(builder: (context, providerObject, child) {
        if (providerObject.products != null) {
          return Expanded(
              child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) => GestureDetector(
              onTap:(){ Navigator.push(context , MaterialPageRoute(builder: (context) => Detiles(id: index),));},
                child: customWidget(
                    providerObject.products!.products[index]["image"],
                    providerObject.products!.products[index]["name"],
                    providerObject.products!.products[index]["price"]
                        .toString())),
            itemCount: providerObject.products!.products.length,
          ));
        } else {
          providerObject.fetchingProducts();
          return Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
