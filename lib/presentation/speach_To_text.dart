import 'package:arbaization/business_logic/speach_To_text/speach_to_text_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;


class speach_To_text extends StatefulWidget {
  @override
  _speach_To_textState createState() => _speach_To_textState();
}

class _speach_To_textState extends State<speach_To_text> {


  @override
  void initState() {
    super.initState();
    SpeachToTextCubit.speech = stt.SpeechToText();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Speech to Text'),
      ),
      body: BlocBuilder<SpeachToTextCubit, SpeachToTextState>(
  builder: (context, state) {
    return Center(
        child: ListView(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 30),
                child: TextButton.icon(
                  label: Text(SpeachToTextCubit.result_Language),
                  icon: Icon(Icons.language),
                  onPressed:() => BlocProvider.of<SpeachToTextCubit>(context).selectLanguage(context),
                )
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () async{
                      BlocProvider.of<SpeachToTextCubit>(context).reset();
                    },
                    icon: Icon(Icons.delete),
                    iconSize: 20,
                  ),
                  IconButton(
                    onPressed: () async{
                      Share.share(SpeachToTextCubit.text);
                      },
                    icon: Icon(Icons.share),
                    iconSize: 20,
                  ),
                  IconButton(
                    onPressed: () async{
                      await Clipboard.setData(ClipboardData(text: SpeachToTextCubit.text));
                      Fluttertoast.showToast(
                        msg: "copyed!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.blue,
                        textColor: Colors.white,
                        fontSize: 16,
                      );                },
                    icon: Icon(Icons.copy),
                    iconSize: 20,
                  ),

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Text(
                    SpeachToTextCubit.text,
                    style: TextStyle(fontSize: 18,color: SpeachToTextCubit.text == 'Say some words ....' ? Colors.grey : Colors.black),
                    textAlign: SpeachToTextCubit.mytextalign,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            IconButton(
              onPressed: (){
                SpeachToTextCubit.text = "";
                if (SpeachToTextCubit.result_Language == 'Arabic') {
                  SpeachToTextCubit.mytextalign = TextAlign.end;

                  BlocProvider.of<SpeachToTextCubit>(context).listen('ar-SA',context);
                } else {
                  SpeachToTextCubit.mytextalign = TextAlign.start;
                  BlocProvider.of<SpeachToTextCubit>(context).listen('en-US',context);
                }
              },
              icon: Icon(SpeachToTextCubit.isListening ? Icons.mic : Icons.mic_none),
              iconSize: 48.0,
            ),
          ],
        ),
      );
  },
),
    );
  }
}