import 'package:arbaization/business_logic/speach_To_text/speach_to_text_cubit.dart';
import 'package:arbaization/business_logic/text_To_speach/text_to_speach_cubit.dart';
import 'package:arbaization/presentation/Main_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SpeachToTextCubit()),
        BlocProvider(create: (context) => TextToSpeachCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Speech to Text and Text to Speech Demo',
        theme: ThemeData(
          iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey))
          ),
          iconTheme: IconThemeData(
            color: Colors.blueGrey,
          ),
          primarySwatch: Colors.blueGrey,
        ),
        home: main_Screen(),
      ),
    );
  }
}

