import '../../../misc/constants.dart';
import 'package:flutter/material.dart';

Widget movieScreen() => Container(
      width: 250,
      height: 50,
      margin: const EdgeInsets.only(top: 24, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        gradient: LinearGradient(
            colors: [saffron.withOpacity(0.33), Colors.transparent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 3,
              color: saffron,
            ),
          ),
          const Center(
            child: Text(
              'Screen',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w200,
              ),
            ),
          )
        ],
      ),
    );
