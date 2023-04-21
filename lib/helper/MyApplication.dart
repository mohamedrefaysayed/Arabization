// ignore_for_file: file_names, empty_catches, non_constant_identifier_names, depend_on_referenced_packages
import 'package:Arbaization/Global/vars.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' show Fluttertoast, Toast, ToastGravity;



// ignore: camel_case_types
class myApplication {

  static double hightClc(int myHeight, BuildContext context) {
    return MediaQuery.of(context).size.height * myHeight / 856.7272727272727;
  }

  static double widthClc(int myWidth, BuildContext context) {
    return MediaQuery.of(context).size.width * myWidth / 392.72727272727275;
  }

  static showToast({
    required String text,
  }) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: isdark ? Colors.white : Colors.black,
      textColor: !isdark ? Colors.white : Colors.black,
      fontSize: 16,
    );
  }

  static navigateTo(Widget page, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: ((context) => page)));
  }
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

  static Future push_fade(BuildContext context, Widget widget, {data}) async => Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (_, __, ___) => widget,
      transitionDuration: const Duration(milliseconds: 350),
      transitionsBuilder: (_, a, b, c) =>
          FadeTransition(opacity: a, child: c),
    ),
  );

  static navigateToRemove(BuildContext context, Widget widget, {data}) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
            (Route<dynamic> route) => false,
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

  static keyboardFocus(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }


}
