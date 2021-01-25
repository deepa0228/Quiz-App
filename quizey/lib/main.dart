import 'package:flutter/material.dart';
import 'package:quizey/ui/home.dart';

final ThemeData _appTheme= _buildAppTheme();
ThemeData _buildAppTheme(){
  final ThemeData base= ThemeData.dark();
  return base.copyWith(
    brightness: Brightness.dark,
    accentColor: Colors.amber,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.red,
    backgroundColor: Colors.amber,
    textTheme: _appTextTheme(base.textTheme),
  );
}
TextTheme _appTextTheme(TextTheme base){
  return base.copyWith(
    headline5: base.headline5.copyWith(
      fontWeight: FontWeight.w500,
    ),
    headline6: base.headline6.copyWith(
      fontSize:16,
    ) ,
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    button: base.button.copyWith(
      letterSpacing:3.0,
      backgroundColor: Colors.red,
    ),
    bodyText2:base.bodyText2.copyWith(
      fontFamily: "Lobster",
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ) 
  ).apply(
    fontFamily: "Lobster",
    displayColor: Colors.amber,
    bodyColor: Colors.red,
  );
}
void main()=> runApp(new MaterialApp(
  theme: _appTheme,
  // theme: ThemeData(
  //   brightness: Brightness.dark,
  //   primaryColor: Colors.lightBlue[900],

  //   textTheme: TextTheme(
  //     headline5: TextStyle(
  //       fontSize:34,
  //       fontWeight: FontWeight.bold
  //     ),
  //     bodyText1: TextStyle(
  //       fontSize:35,
  //       fontWeight: FontWeight.bold,
  //     )
  //   ),
  // ),
  home:QuizApp(),
  debugShowCheckedModeBanner: false,
));

