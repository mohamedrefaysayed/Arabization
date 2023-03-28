import 'package:arbaization/business_logic/text_To_speach/text_to_speach_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;



class text_To_speach extends StatefulWidget {
  @override
  _text_To_speachState createState() => _text_To_speachState();
}

class _text_To_speachState extends State<text_To_speach> {

  @override
  void initState() {
    super.initState();
    TextToSpeachCubit.speech = stt.SpeechToText();
    TextToSpeachCubit.flutterTts = FlutterTts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Text to Speech'),
      ),
      body: BlocBuilder<TextToSpeachCubit, TextToSpeachState>(
        builder: (context, state) {
          return Center(
            child: ListView(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 30),
                    child: TextButton.icon(
                      label: Text(TextToSpeachCubit.result_Language),
                      icon: Icon(Icons.language),
                      onPressed: () => BlocProvider.of<TextToSpeachCubit>(context).selectLanguage(context),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextFormField(
                    textAlign: TextToSpeachCubit.mytextalign,
                    maxLines: null,
                    decoration: InputDecoration(

                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: const OutlineInputBorder(),
                      hintText: 'Enter some text ....',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {
                      TextToSpeachCubit.text = value;
                    },
                  ),
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: ElevatedButton(
                    onPressed: () async {
                     BlocProvider.of<TextToSpeachCubit>(context).speak();
                    },
                    child: Text('Transform'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}