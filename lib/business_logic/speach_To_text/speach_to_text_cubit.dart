import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
part 'speach_to_text_state.dart';

class SpeachToTextCubit extends Cubit<SpeachToTextState> {
  static String text = 'Say some words ....';
  static String result_Language = "English";
  static bool isListening = false;
  static TextAlign mytextalign = TextAlign.start;
  static late stt.SpeechToText speech;



  SpeachToTextCubit() : super(SpeachToTextInitial());

  Future selectLanguage(context) async {
    // Define a list of languages to choose from
    final List<String> languages = ['English', 'Arabic'];

    // Show a dialog box with the list of languages
    result_Language = (await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Select Language'),
          children: languages
              .map((lang) => SimpleDialogOption(
            onPressed: () {
              emit(SpeachToTextInitial());
              Navigator.pop(context, lang);
            },
            child: Text(lang),
          ))
              .toList(),
        );
      },
    ))!;

    if (result_Language == 'Arabic') {
      mytextalign = TextAlign.end;
    } else {
      mytextalign = TextAlign.start;

    }
  }

  listen(language,context) async {
    if (!SpeachToTextCubit.isListening) {
      isListening = true;
      emit(SpeachToTextInitial());
      // Show language selection dialog
      bool available = await speech.initialize(
        onStatus: (language) => print('onStatus: $language'),
        onError: (language) => print('onError: $language'),
      );
      if (available) {
       await speech.listen(
          onResult: (language){
            text = language.recognizedWords;
            emit(SpeachToTextInitial());

          },
          localeId: language,
        );
        isListening = false;
      } else {

        speech.stop().whenComplete(() => (){
          isListening = false;
          emit(SpeachToTextInitial());
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Microphone permission not granted")),
        );
        // You can show an alert dialog here to request the user to grant the microphone permission.
      }


    } else {
      isListening = false;
      emit(SpeachToTextInitial());    }
  }

  reset(){
    text = 'Say some words ....';
    emit(SpeachToTextInitial());
  }



}
