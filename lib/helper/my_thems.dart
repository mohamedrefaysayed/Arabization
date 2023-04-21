import 'package:Arbaization/helper/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Mythems{
  static final lighttheme = ThemeData(
      fontFamily: "Vazirmatn",
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )
            )
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: MyColors.mov,fontSize: 22,fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(color: MyColors.mov),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(fontFamily: "Vazirmatn",color: MyColors.mov,fontSize: 22),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
        backgroundColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.grey.withOpacity(0.5),

        iconTheme: IconThemeData(
          color: Colors.white
        )
      ),
      scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: MyColors.mov)
  );


  static final darktheme = ThemeData(
      fontFamily: "Vazirmatn",

      elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )
          )
      ),
    ),
    textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.white,fontSize: 20),
      bodyMedium: TextStyle(color: MyColors.mov),
    ),
      iconTheme: IconThemeData(color: Colors.black),
      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(fontFamily: "Vazirmatn",color: MyColors.mov,fontSize: 22),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          backgroundColor: Color(0xff1B1B1B),
          elevation: 0,
          iconTheme: IconThemeData(
              color: MyColors.mov,
          )
      ),
      scaffoldBackgroundColor: MyColors.blk,
      colorScheme: ColorScheme.fromSeed(seedColor: MyColors.mov)

  );
}