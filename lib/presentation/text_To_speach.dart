import 'package:Arbaization/Global/vars.dart';
import 'package:Arbaization/helper/MyApplication.dart';
import 'package:Arbaization/helper/MyColors.dart';
import 'package:Arbaization/helper/gradient_evbutt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../business_logic/darkMoodANDtranslation/dark_mood_AND_translation_cubit.dart';
import '../business_logic/text_To_speach/text_to_speach_cubit.dart';

class text_To_speach extends StatefulWidget {
  @override
  _text_To_speachState createState() => _text_To_speachState();
}

class _text_To_speachState extends State<text_To_speach> {
  @override

  TextEditingController _textController = TextEditingController();

  void initState() {
    super.initState();
    TextToSpeachCubit.speech = stt.SpeechToText();
    TextToSpeachCubit.flutterTts = FlutterTts();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myApplication.keyboardFocus(context);
      },
      child: Stack(
        children: [
          Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(myApplication.hightClc(190, context)),
              child: AppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                toolbarHeight: myApplication.hightClc(200, context),
                title: Column(
                  children: [
                    SizedBox(
                      height: myApplication.hightClc(50, context),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_new_sharp,
                            color: MyColors.mov,
                            size: myApplication.widthClc(30, context),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(
                          width: myApplication.widthClc(70, context),
                        ),
                        Text(
                          DarkMoodANDtranslationCubit.texttospeach,
                          style: TextStyle(fontWeight: FontWeight.bold,color: MyColors.mov),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: myApplication.hightClc(50, context),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: myApplication.widthClc(15, context)),
                      child: BlocBuilder<TextToSpeachCubit, TextToSpeachState>(
                        builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: myApplication.hightClc(40, context),
                                width: myApplication.widthClc(130, context),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          TextToSpeachCubit.result_Language ==
                                                  "English"
                                              ? MyColors.mov
                                              : null,
                                      side: BorderSide(
                                        color: MyColors.mov,
                                        width: 2.0,
                                      ),
                                    ),
                                    onPressed: () =>
                                        BlocProvider.of<TextToSpeachCubit>(
                                                context)
                                            .selectLanguage("English"),
                                    child: Text(
                                      "English",
                                      style: TextStyle(
                                          fontSize: myApplication.widthClc(20, context),
                                          color: TextToSpeachCubit
                                                      .result_Language ==
                                                  "English"
                                              ? Colors.white
                                              : MyColors.mov),
                                    )),
                              ),
                              Container(
                                height: myApplication.hightClc(40, context),
                                width: myApplication.widthClc(130, context),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          TextToSpeachCubit.result_Language ==
                                                  "Arabic"
                                              ? MyColors.mov
                                              : null,
                                      side: BorderSide(
                                        color: MyColors.mov,
                                        width: 2.0,
                                      ),
                                    ),
                                    onPressed: () =>
                                        BlocProvider.of<TextToSpeachCubit>(
                                                context)
                                            .selectLanguage("Arabic"),
                                    child: Text(
                                      "العربية",
                                      style: TextStyle(
                                          fontSize: myApplication.widthClc(20, context),
                                          color: TextToSpeachCubit
                                                      .result_Language ==
                                                  "Arabic"
                                              ? Colors.white
                                              : MyColors.mov),
                                    )),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: myApplication.hightClc(50, context),
                    )
                  ],
                ),
              ),
            ),
            body: ListView(
              children: <Widget>[
                SizedBox(
                  height: myApplication.hightClc(75, context),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: myApplication.widthClc(25, context)),
                  child: BlocBuilder<TextToSpeachCubit, TextToSpeachState>(
                    builder: (context, state) {
                      return Container(
                        decoration: BoxDecoration(
                          boxShadow: !isdark ? [BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            blurRadius: 10,
                            spreadRadius: 1,
                          )] : null,
                        ),
                        child: TextFormField(
                          controller: _textController,
                          style: TextStyle(
                              color: isdark ? Colors.white : Colors.black),
                          minLines: 6,
                          textAlign: TextToSpeachCubit.mytextalign,
                          maxLines: null,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: myApplication.hightClc(20, context),
                                horizontal: myApplication.widthClc(20, context)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 0.5,color: MyColors.mov),
                            ),
                            filled: true,
                            fillColor: isdark ? Color(0xff252525) : Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  myApplication.widthClc(10, context)),
                            ),
                            hintText:
                                TextToSpeachCubit.result_Language == "English"
                                    ? 'Enter some text ....'
                                    : ".... أدخل بعض الكلمات",
                            hintStyle: TextStyle(
                                color: isdark ? Colors.grey : Colors.black),
                          ),
                          onChanged: (value) {
                            TextToSpeachCubit.text = value;
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () async{
                        BlocProvider.of<TextToSpeachCubit>(context).reset();
                        _textController.text = "";
                      },
                      icon: Icon(Icons.delete),
                      iconSize: myApplication.widthClc(25, context),
                      color: MyColors.mov,
                    ),
                  ),
                ),

                SizedBox(height: myApplication.hightClc(50, context)),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: myApplication.hightClc(30, context)),
                  width: double.infinity,
                  height: myApplication.hightClc(50, context),
                  child: MyElevatedButton(
                    gradient: LinearGradient(
                        colors: [
                          MyColors.mov,
                          MyColors.blu.withOpacity(0.4),

                        ]),
                    borderRadius: BorderRadius.circular(20),
                    onPressed: () async {
                      BlocProvider.of<TextToSpeachCubit>(context).speak();
                    },
                    child: Text(
                      DarkMoodANDtranslationCubit.trasform,
                      style: TextStyle(fontSize: myApplication.widthClc(20, context)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              left: myApplication.widthClc(162, context),
              top: myApplication.hightClc(210, context),
              child: Container(
                height: myApplication.hightClc(55, context),
                width: myApplication.widthClc(70, context),
                decoration: BoxDecoration(
                    boxShadow: !isdark ? [BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 5,
                    offset: Offset(1, 4),
                    spreadRadius: 0.1,
                  )] : null,
                  color: isdark ? Color(0xff252525) : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                    bottomLeft: Radius.circular(90),
                    bottomRight: Radius.circular(90),
                  ),
                ),
                child: Image.asset("assets/images/Vector.png"),
              )),
        ],
      ),
    );
  }
}
