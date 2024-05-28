// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class FavoritesContainer extends StatelessWidget {
  const FavoritesContainer({
    super.key,
    // required this.img,
    // required this.food,
    // required this.time,
    // required this.rating,
    // required this.price,
  });
  // final String img;
  // final String food;
  // final String time;
  // final String price;
  // final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      decoration: BoxDecoration(
        border: Border.symmetric(),
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Bangarang.jpg"), fit: BoxFit.fill),
            ),
          ),
          Text(
            "Artist Name",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "# tracks",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
