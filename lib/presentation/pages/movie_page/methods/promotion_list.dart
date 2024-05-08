import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<Widget> promotionList(List<String> promotionImageFile) => [
      Padding(
        padding: const EdgeInsets.only(left: 24, bottom: 15),
        child: Text(
          'Promotions',
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: promotionImageFile
              .map((e) => Padding(
                    padding: EdgeInsets.only(
                        left: e == promotionImageFile.first ? 24 : 10,
                        right: e == promotionImageFile.last ? 24 : 0),
                    child: Container(
                      width: 240,
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: AssetImage('assets/$e')),
                      ),
                    ),
                  ))
              .toList(),
        ),
      )
    ];
