// ignore_for_file: file_names, empty_catches, non_constant_identifier_names, depend_on_referenced_packages
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart' show Fluttertoast, Toast, ToastGravity;



// ignore: camel_case_types
class myApplication {

  static double hightClc(int myHeight, BuildContext context) {
    return MediaQuery.of(context).size.height * myHeight / 856.7272727272727;
  }

  static double widthClc(int myWidth, BuildContext context) {
    return MediaQuery.of(context).size.width * myWidth / 392.72727272727275;
  }

  static navigateTo(Widget page, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: ((context) => page)));
  }

  static navigateToRemove(BuildContext context, Widget widget, {data}) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
        (Route<dynamic> route) => false,
      );
  static navigateToReplace(BuildContext context, Widget page) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: ((context) => page)));
  }

  static showToast({
    required String text,
    required color,
  }) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: color,
      textColor: Colors.blueGrey,
      fontSize: 16,
    );
  }

  static Future push_fade(BuildContext context, Widget widget, {data}) async => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => widget,
          transitionDuration: const Duration(milliseconds: 250),
          transitionsBuilder: (_, a, b, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      );
  static push_scale(BuildContext context, Widget widget, {data}) =>
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => widget,
          transitionDuration: const Duration(milliseconds: 250),
          transitionsBuilder: (_, a, __, c) =>
              ScaleTransition(scale: a, child: c),
        ),
      );
  static Future push_size(BuildContext context, Widget widget, {data}) =>
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => widget,
          transitionDuration: const Duration(milliseconds: 250),
          transitionsBuilder: (_, a, __, c) => Align(
            child: SizeTransition(
              sizeFactor: a,
              axisAlignment: 0.0,
              child: c,
            ),
          ),
        ),
      );
  static push_rotation(BuildContext context, Widget widget, {data}) =>
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => widget,
          transitionDuration: const Duration(milliseconds: 250),
          transitionsBuilder: (_, a, __, c) => RotationTransition(
            turns: a,
            child: c,
          ),
        ),
      );
  static push_right(BuildContext context, Widget widget, {data}) =>
      Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => widget,
            transitionDuration: const Duration(milliseconds: 250),
            transitionsBuilder: (_, a, __, c) => SlideTransition(
                  position:
                      Tween(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0))
                          .animate(a),
                  child: c,
                )),
      );
  static push_left(BuildContext context, Widget widget, {data}) =>
      Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => widget,
            transitionDuration: const Duration(milliseconds: 250),
            transitionsBuilder: (_, a, __, c) => SlideTransition(
                  position:
                      Tween(begin: const Offset(-1.0, 0.0), end: const Offset(0.0, 0.0))
                          .animate(a),
                  child: c,
                )),
      );
  static push_up(BuildContext context, Widget widget, {data}) => Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => widget,
            transitionDuration: const Duration(milliseconds: 250),
            transitionsBuilder: (_, a, __, c) => SlideTransition(
                  position:
                      Tween(begin: const Offset(0.0, -1.0), end: const Offset(0.0, 0.0))
                          .animate(a),
                  child: c,
                )),
      );
  static push_down(BuildContext context, Widget widget, {data}) =>
      Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => widget,
            transitionDuration: const Duration(milliseconds: 250),
            transitionsBuilder: (_, a, __, c) => SlideTransition(
                  position:
                      Tween(begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0))
                          .animate(a),
                  child: c,
                )),
      );

  static keyboardFocus(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }


}
