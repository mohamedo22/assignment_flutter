import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

StatelessWidget customWidget(urlImage , name , price){
  return Container(
    width: 80,
    child: Card(
      color: Colors.white,
      margin: EdgeInsets.all(10),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 150, height: 130, child: Image.network(urlImage),),
          SizedBox(height: 5),
          Text(name),
          SizedBox(height: 5,),
          Text(price)
        ],
      ),
    ),
  );
}