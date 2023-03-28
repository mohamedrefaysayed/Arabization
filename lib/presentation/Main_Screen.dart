import 'package:arbaization/presentation/speach_To_text.dart';
import 'package:arbaization/presentation/text_To_speach.dart';
import 'package:flutter/material.dart';

class main_Screen extends StatefulWidget {
  const main_Screen({Key? key}) : super(key: key);

  @override
  State<main_Screen> createState() => _main_ScreenState();
}

class _main_ScreenState extends State<main_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("arabization app"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => text_To_speach()));
              },
              child: Text("text_To_speach",style: TextStyle(fontSize: 30),),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => speach_To_text()));
              },
              child: Text("speach_To_text",style: TextStyle(fontSize: 30),),
            ),

          ],
        ),
      ),
    );
  }
}
