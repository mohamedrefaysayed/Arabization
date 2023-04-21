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

  selectLanguage(lang) {
    result_Language = lang;
    if (lang == 'Arabic') {
      mytextalign = TextAlign.end;
    } else {
      mytextalign = TextAlign.start;
    }
    emit(SpeachToTextInitial());

  }

  listen(language,context) async {
    if (!isListening) {
      isListening = true;
      emit(SpeachToTextInitial());
      // Show language selection dialog
      bool available = await speech.initialize(
        onStatus: (language) {
          print('onStatus: $language');
          if(language == "notListening"){
            isListening = false;
            emit(SpeachToTextInitial());
          }
          if(language == "Listening"){
            isListening = true;
            emit(SpeachToTextInitial());
          }
          },
        onError: (language) {
          print('onError: $language');
          isListening = false;
          emit(SpeachToTextInitial());
        }
      );
      if (available) {
       await speech.listen(
          onResult: (language){
            text = language.recognizedWords;
            emit(SpeachToTextInitial());

          },
          localeId: language,
        );
      } else {

        speech.stop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Microphone permission not granted")),
        );
        // You can show an alert dialog here to request the user to grant the microphone permission.
      }


    }


  }

  reset(){
    text = 'Say some words ....';
    emit(SpeachToTextInitial());
  }



}
