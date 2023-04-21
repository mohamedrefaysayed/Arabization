import 'dart:io';
import 'package:Arbaization/Global/vars.dart';
import 'package:Arbaization/helper/MyApplication.dart';
import 'package:Arbaization/helper/MyColors.dart';
import 'package:Arbaization/helper/gradient_evbutt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import '../business_logic/darkMoodANDtranslation/dark_mood_AND_translation_cubit.dart';
import '../business_logic/text_Recognition/text_recognition_cubit.dart';

class Text_Recognition extends StatelessWidget {
  const Text_Recognition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextRecognitionCubit, TextRecognitionState>(
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(myApplication.hightClc(100, context)),
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
                              TextRecognitionCubit.inResult
                              ? {
                                BlocProvider.of<TextRecognitionCubit>(context).getinit(),
                                TextRecognitionCubit.inResult = false
                              }
                              : Navigator.pop(context);
                            },
                          ),
                          SizedBox(
                            width: myApplication.widthClc(70, context),
                          ),
                          Text(
                            DarkMoodANDtranslationCubit.textrecognition,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: MyColors.mov),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: myApplication.hightClc(50, context),
                      )
                    ],
                  ),
                ),
              ),
              body: BlocBuilder<TextRecognitionCubit, TextRecognitionState>(
                builder: (context, state) {
                  if(state is TextRecognitionInitial){
                    return Container(
                        margin: EdgeInsets.all(myApplication.widthClc(20, context)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height:myApplication.hightClc(35, context) ,),
                            Container(
                                height: myApplication.hightClc(70, context),
                                decoration: BoxDecoration(
                                    color: isdark ? Color(0xff1B1B1B) : Colors.white,
                                    boxShadow: !isdark ? [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.7),
                                        blurRadius: 10,
                                        spreadRadius: 1,
                                      )] : null,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                    child: Text(
                                      DarkMoodANDtranslationCubit.noarabicwarning,
                                      style: TextStyle(
                                          color: isdark ? Colors.white : Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: myApplication.widthClc(16, context)),
                                      textAlign: TextAlign.center,
                                    ))),
                            SizedBox(
                              height: myApplication.hightClc(20, context),
                            ),
                            TextRecognitionCubit.imageFile != null
                              ? Image.file(
                                File(TextRecognitionCubit.imageFile!.path),
                                width: myApplication.widthClc(400, context),
                                height: myApplication.hightClc(300, context),
                              )
                              : Container(
                              decoration: BoxDecoration(
                                color: isdark
                                    ? Color(0xff1B1B1B)
                                    : Colors.grey[300]!,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: myApplication.widthClc(400, context),
                              height: myApplication.hightClc(300, context),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: myApplication.hightClc(80, context),
                                    width: myApplication.widthClc(95, context),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: isdark
                                            ? Color(0xff1B1B1B)
                                            : Colors.white,
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10)),
                                      ),
                                      onPressed: () {
                                        BlocProvider.of<TextRecognitionCubit>(
                                            context)
                                            .getImage(ImageSource.gallery);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical:
                                            myApplication.hightClc(5, context),
                                            horizontal:
                                            myApplication.widthClc(5, context)),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.image,
                                              size: myApplication.widthClc(
                                                  42, context),
                                              color: MyColors.mov,
                                            ),
                                            Text(
                                              DarkMoodANDtranslationCubit.gallery,
                                              style: TextStyle(
                                                  fontSize: myApplication.widthClc(
                                                      14, context),
                                                  color: MyColors.mov),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  width: myApplication.widthClc(50, context),
                                ),
                                Container(
                                    height: myApplication.hightClc(80, context),
                                    width: myApplication.widthClc(95, context),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: isdark
                                            ? Color(0xff1B1B1B)
                                            : Colors.white,
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10)),
                                      ),
                                      onPressed: () {
                                        BlocProvider.of<TextRecognitionCubit>(
                                            context)
                                            .getImage(ImageSource.camera);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical:
                                            myApplication.hightClc(5, context),
                                            horizontal:
                                            myApplication.widthClc(5, context)),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.camera_alt,
                                              size: myApplication.widthClc(
                                                  42, context),
                                              color: MyColors.mov,
                                            ),
                                            Text(
                                              DarkMoodANDtranslationCubit.camera,
                                              style: TextStyle(
                                                fontSize: myApplication.widthClc(
                                                    14, context),
                                                color: MyColors.mov,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                            SizedBox(height: myApplication.hightClc(50, context)),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: myApplication.hightClc(10, context)),
                              width: double.infinity,
                              height: myApplication.hightClc(50, context),
                              child: MyElevatedButton(
                                gradient: LinearGradient(colors: [
                                  MyColors.mov,
                                  MyColors.blu.withOpacity(0.4),
                                ]),
                                borderRadius: BorderRadius.circular(20),
                                onPressed: () async {
                                  BlocProvider.of<TextRecognitionCubit>(context)
                                      .getRecognisedText(
                                      TextRecognitionCubit.imageFile!);
                                  TextRecognitionCubit.inResult = true;
                                },
                                child: Text(
                                  DarkMoodANDtranslationCubit.process,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: myApplication.hightClc(30, context),
                            ),
                          ],
                        ));
                  }
                  else{
                    return ListView(
                      children: [
                        SizedBox(height: myApplication.hightClc(65, context)),
                        TextRecognitionCubit.textScanning
                            ? Center(child: CircularProgressIndicator(color: MyColors.mov))
                            :Padding(
                          padding:  EdgeInsets.symmetric(horizontal: myApplication.hightClc(25, context)),
                          child: Container(
                            constraints: BoxConstraints(
                              minHeight: myApplication.hightClc(400, context), minWidth: double.infinity,),
                            decoration: BoxDecoration(
                              color: isdark ? Color(0xff1B1B1B) : Colors.white,
                              boxShadow: !isdark ? [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                )] : null,
                              border: Border.all(color: MyColors.mov),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: myApplication.widthClc(20, context),vertical: myApplication.hightClc(10, context)),
                              child: Text(
                                TextRecognitionCubit.scannedText,
                                style: TextStyle(
                                    fontSize: myApplication.widthClc(16, context),
                                    color: isdark ? Colors.white : Colors.black),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: myApplication.hightClc(20, context),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(bottom: myApplication.hightClc(30, context), left: myApplication.widthClc(20, context)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () async{
                                  BlocProvider.of<TextRecognitionCubit>(context).reset();
                                },
                                icon: Icon(Icons.delete,color: MyColors.mov,),
                                iconSize: myApplication.widthClc(25, context),
                              ),
                              IconButton(
                                onPressed: () async{
                                  Share.share(TextRecognitionCubit.scannedText);
                                },
                                icon: Icon(Icons.share),
                                iconSize: myApplication.widthClc(25, context),
                                color: MyColors.mov,

                              ),
                              IconButton(
                                onPressed: () async{
                                  await Clipboard.setData(ClipboardData(text: TextRecognitionCubit.scannedText));
                                  myApplication.showToast(text: "copyed!");
                                },
                                icon: Icon(Icons.copy,color: MyColors.mov,
                                ),
                                iconSize: myApplication.widthClc(25, context),
                              ),

                            ],
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
            Positioned(
                left: myApplication.widthClc(162, context),
                top: myApplication.hightClc(120, context),
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
        );
      },
    );
  }
}
