import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:meta/meta.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
part 'text_to_speach_state.dart';


class TextToSpeachCubit extends Cubit<TextToSpeachState> {
  static TextAlign mytextalign = TextAlign.start;
  static String result_Language = "English";
  static String text = '';
  static late FlutterTts flutterTts;
  static late stt.SpeechToText speech = stt.SpeechToText();


  TextToSpeachCubit() : super(TextToSpeachInitial());

   selectLanguage(lang) {
     result_Language = lang;
     if (lang == 'Arabic') {
       mytextalign = TextAlign.end;
     } else {
       mytextalign = TextAlign.start;
     }
     emit(TextToSpeachInitial());

   }

  Future speak() async {
    if (result_Language == 'Arabic') {
      await flutterTts.setLanguage('ar-SA');
    } else {
      await flutterTts.setLanguage('en-US');

    }
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
    emit(TextToSpeachInitial());
  }


  updateText(val){
    text = val;
    emit(TextToSpeachInitial());
  }
  reset(){
    text = '';
    emit(TextToSpeachInitial());
  }
}
