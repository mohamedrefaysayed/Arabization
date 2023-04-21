import 'package:Arbaization/Global/vars.dart';
import 'package:Arbaization/helper/MyApplication.dart';
import 'package:Arbaization/helper/MyColors.dart';
import 'package:Arbaization/presentation/Text_Recognition.dart';
import 'package:Arbaization/presentation/setting.dart';
import 'package:Arbaization/presentation/speach_To_text.dart';
import 'package:Arbaization/presentation/text_To_speach.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../business_logic/darkMoodANDtranslation/dark_mood_AND_translation_cubit.dart';

class main_Screen extends StatefulWidget {
  const main_Screen({Key? key}) : super(key: key);

  @override
  State<main_Screen> createState() => _main_ScreenState();
}

class _main_ScreenState extends State<main_Screen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkMoodANDtranslationCubit, DarkMoodANDtranslationState>(
  builder: (context, state) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      MyColors.blu,
                      MyColors.mov,
                      MyColors.bink,
                    ]

                )
            ),
          ),
          Positioned(
            top: myApplication.hightClc(72, context),
              left: myApplication.widthClc(42, context),
              child: InkWell(
                onTap: () => myApplication.push_left(context, settings()),
                child: Icon(
                  Icons.settings,size: myApplication.widthClc(35, context),
                ),
              ),
          ),
          Center(
            child: Padding(
              padding:  EdgeInsets.all(myApplication.widthClc(49, context)),
              child: Column(
                children: [
                  SizedBox(height:myApplication.hightClc(100, context)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("A",style: TextStyle(fontSize: myApplication.widthClc(100, context) ,color: isdark ? Colors.black : Colors.white,fontFamily: "POST NO BILLS",fontWeight: FontWeight.bold,),),
                      SizedBox(width: myApplication.widthClc(10, context)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("rabization\npp",style: TextStyle(fontSize: myApplication.widthClc(28, context),color: isdark ? Colors.black : Colors.white,fontFamily: "Poppins",fontWeight: FontWeight.bold,height: 0.9),),

                        ],
                      ),
                    ],
                  ),
                  SizedBox(height:myApplication.hightClc(150, context)),
                  Container(
                    width: double.infinity,
                    height: myApplication.hightClc(48, context),
                    child: ElevatedButton(
                      onPressed: () async{
                        myApplication.push_up(context, text_To_speach());
                      },
                      child: Text(DarkMoodANDtranslationCubit.texttospeach,style: Theme.of(context).textTheme.bodyLarge,),
                    ),
                  ),
                  SizedBox(height:myApplication.hightClc(54, context)),
                  Container(
                    width: double.infinity,
                    height: myApplication.hightClc(48, context),
                    child: ElevatedButton(
                      onPressed: () async{
                        myApplication.push_up(context, speach_To_text());
                      },
                      child: Text(DarkMoodANDtranslationCubit.speachtotext,style: Theme.of(context).textTheme.bodyLarge,),
                    ),
                  ),
                  SizedBox(height:myApplication.hightClc(54, context)),
                  Container(
                    width: double.infinity,
                    height: myApplication.hightClc(48, context),
                    child: ElevatedButton(
                      onPressed: () async{
                        myApplication.push_up(context, Text_Recognition());
                      },
                      child: Text(DarkMoodANDtranslationCubit.textrecognition,style: Theme.of(context).textTheme.bodyLarge,),
                    ),
                  ),
                  SizedBox(height:myApplication.hightClc(54, context)),


                ],
              ),
            ),
          ),
        ],
      ),
    );
  },
);
  }
}
