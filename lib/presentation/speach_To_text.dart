import 'package:Arbaization/Global/vars.dart';
import 'package:Arbaization/helper/MyApplication.dart';
import 'package:Arbaization/helper/MyColors.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../business_logic/darkMoodANDtranslation/dark_mood_AND_translation_cubit.dart';
import '../business_logic/speach_To_text/speach_to_text_cubit.dart';

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
    return Stack(
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
                        DarkMoodANDtranslationCubit.speachtotext,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: MyColors.mov,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: myApplication.hightClc(50, context),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: myApplication.widthClc(15, context)),
                    child: BlocBuilder<SpeachToTextCubit, SpeachToTextState>(
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
                                        SpeachToTextCubit.result_Language ==
                                                "English"
                                            ? MyColors.mov
                                            : null,
                                    side: BorderSide(
                                      color: MyColors.mov,
                                      width: 2.0,
                                    ),
                                  ),
                                  onPressed: () =>
                                      BlocProvider.of<SpeachToTextCubit>(
                                              context)
                                          .selectLanguage("English"),
                                  child: Text(
                                    "English",
                                    style: TextStyle(
                                        fontSize: myApplication.widthClc(20, context),
                                        color:
                                            SpeachToTextCubit.result_Language ==
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
                                        SpeachToTextCubit.result_Language ==
                                                "Arabic"
                                            ? MyColors.mov
                                            : null,
                                    side: BorderSide(
                                      color: MyColors.mov,
                                      width: 2.0,
                                    ),
                                  ),
                                  onPressed: () =>
                                      BlocProvider.of<SpeachToTextCubit>(
                                              context)
                                          .selectLanguage("Arabic"),
                                  child: Text(
                                    "العربية",
                                    style: TextStyle(
                                        fontSize: myApplication.widthClc(20, context),
                                        color:
                                            SpeachToTextCubit.result_Language ==
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
          body: BlocBuilder<SpeachToTextCubit, SpeachToTextState>(
            builder: (context, state) {
              return Center(
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: myApplication.hightClc(70, context),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        constraints: BoxConstraints(
                          minHeight: myApplication.hightClc(330, context),
                          minWidth: double.infinity,
                        ),
                        decoration: BoxDecoration(
                          color: isdark ? Color(0xff1B1B1B) : Colors.white,
                          boxShadow: !isdark
                              ? [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.7),
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                  )
                                ]
                              : null,
                          border: Border.all(color: MyColors.mov),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(
                              horizontal: myApplication.widthClc(20, context), vertical: myApplication.widthClc(10, context)),
                          child: Text(
                            SpeachToTextCubit.text == 'Say some words ....' ||
                                    SpeachToTextCubit.text == ''
                                ? (SpeachToTextCubit.result_Language ==
                                        "English"
                                    ? "Say some words ...."
                                    : ".... قل شيئا")
                                : SpeachToTextCubit.text,
                            style: TextStyle(
                                fontSize: myApplication.widthClc(18, context),
                                color: isdark
                                    ? Colors.white
                                    : (SpeachToTextCubit.text ==
                                                'Say some words ....' ||
                                            SpeachToTextCubit.text == ''
                                        ? Colors.grey
                                        : Colors.black)),
                            textAlign: SpeachToTextCubit.mytextalign,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(bottom: myApplication.hightClc(10, context), left: myApplication.widthClc(15, context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () async {
                              BlocProvider.of<SpeachToTextCubit>(context)
                                  .reset();
                            },
                            icon: Icon(Icons.delete),
                            iconSize: myApplication.widthClc(25, context),
                            color: MyColors.mov,
                          ),
                          IconButton(
                            onPressed: () async {
                              Share.share(SpeachToTextCubit.text);
                            },
                            icon: Icon(Icons.share),
                            iconSize: myApplication.widthClc(25, context),
                            color: MyColors.mov,
                          ),
                          IconButton(
                            onPressed: () async {
                              await Clipboard.setData(
                                  ClipboardData(text: SpeachToTextCubit.text));
                              myApplication.showToast(text: "copyed!");
                            },
                            icon: Icon(Icons.copy),
                            iconSize: myApplication.widthClc(25, context),
                            color: MyColors.mov,
                          ),
                        ],
                      ),
                    ),
                    SpeachToTextCubit.isListening
                        ? Container(
                          child: Center(
                            child: AvatarGlow(
                                glowColor: MyColors.mov,
                                endRadius: 100,
                                duration: Duration(milliseconds: 1000),
                                repeat: true,
                                showTwoGlows: true,
                                repeatPauseDuration: Duration(milliseconds: 100),
                                child: GestureDetector(
                                  onTap: () {
                                    SpeachToTextCubit.text = "";
                                    if (SpeachToTextCubit.result_Language ==
                                        'Arabic') {
                                      SpeachToTextCubit.mytextalign = TextAlign.end;

                                      BlocProvider.of<SpeachToTextCubit>(context)
                                          .listen('ar-SA', context);
                                    } else {
                                      SpeachToTextCubit.mytextalign =
                                          TextAlign.start;
                                      BlocProvider.of<SpeachToTextCubit>(context)
                                          .listen('en-US', context);
                                    }
                                  },
                                  child: Container(
                                    height: myApplication.hightClc(100, context),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: MyColors.mov)),
                                    child: Padding(
                                      padding:  EdgeInsets.all(myApplication.widthClc(30, context)),
                                      child: Icon(
                                        SpeachToTextCubit.isListening
                                            ? Icons.mic
                                            : Icons.mic_none,
                                        size: myApplication.widthClc(48, context),
                                        color: MyColors.mov,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ),
                      height: myApplication.hightClc(110, context),
                        )
                        : GestureDetector(
                            onTap: () {
                              SpeachToTextCubit.text = "";
                              if (SpeachToTextCubit.result_Language ==
                                  'Arabic') {
                                SpeachToTextCubit.mytextalign = TextAlign.end;

                                BlocProvider.of<SpeachToTextCubit>(context)
                                    .listen('ar-SA', context);
                              } else {
                                SpeachToTextCubit.mytextalign = TextAlign.start;
                                BlocProvider.of<SpeachToTextCubit>(context)
                                    .listen('en-US', context);
                              }
                            },
                            child: SizedBox(
                              height: myApplication.hightClc(120, context),

                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: MyColors.mov)),
                                  child: Padding(
                                    padding:  EdgeInsets.all(myApplication.widthClc(30, context)),
                                    child: Icon(
                                      SpeachToTextCubit.isListening
                                          ? Icons.mic
                                          : Icons.mic_none,
                                      size: myApplication.widthClc(48, context),
                                      color: MyColors.mov,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                    SizedBox(
                      height: myApplication.hightClc(20, context),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Positioned(
            left: myApplication.widthClc(162, context),
            top: myApplication.hightClc(210, context),
            child: Container(
              height: myApplication.hightClc(55, context),
              width: myApplication.widthClc(70, context),
              decoration: BoxDecoration(
                boxShadow: !isdark
                    ? [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5,
                          offset: Offset(1, 4),
                          spreadRadius: 0.1,
                        )
                      ]
                    : null,
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
    );
  }
}
