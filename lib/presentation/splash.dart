import 'dart:async';

import 'package:Arbaization/Global/vars.dart';
import 'package:Arbaization/helper/MyApplication.dart';
import 'package:Arbaization/helper/MyColors.dart';
import 'package:Arbaization/presentation/Main_Screen.dart';
import 'package:flutter/material.dart';

import '../business_logic/darkMoodANDtranslation/dark_mood_AND_translation_cubit.dart';

class Ani_splash extends StatefulWidget {
  const Ani_splash({Key? key}) : super(key: key);

  @override
  State<Ani_splash> createState() => _Ani_splashState();
}

class _Ani_splashState extends State<Ani_splash> with TickerProviderStateMixin{
  @override

  AnimationController? _controller;
  AnimationController? _Acontroller;


  Animation<Offset>? _animation;
  Animation<Offset>? _Aanimation;

  bool isanimating = false;
  bool gotonativ = false;

  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 2500));
    _Acontroller = AnimationController(vsync: this,duration: Duration(milliseconds: 2450));

    _animation = Tween<Offset>(
        begin: Offset(-0.95,0.8),
        end: Offset(1.5,-1.5)
    ).animate(CurvedAnimation(parent: _controller!,curve: Curves.easeIn));
    _Aanimation = Tween<Offset>(
        begin: Offset(0.0,-0.55),
        end: Offset.zero
    ).animate(CurvedAnimation(parent: _Acontroller!,curve: Curves.easeIn));

    super.initState();
  }
  @override
  void dispose() {
    _controller!.dispose();
    _Acontroller!.dispose();

    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
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
          gotonativ
              ? Center(
            child: SlideTransition(
              position: _Aanimation!,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("A",style: TextStyle(fontSize: myApplication.widthClc(100, context) ,color: isdark ? Colors.black : Colors.white,fontFamily: "POST NO BILLS",fontWeight: FontWeight.bold,),),                SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("rabization\npp",style: TextStyle(fontSize: myApplication.widthClc(28, context),color: isdark ? Colors.black : Colors.white,fontFamily: "Poppins",fontWeight: FontWeight.bold,height: 0.9),),

                    ],
                  ),
                ],
              ),

            ),
          )
          : SizedBox(),
          !gotonativ
          ? SlideTransition(
            position: _animation!,
            child: Transform.scale(
              scale: 2.5,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isdark ? Colors.black : Colors.white,
                ),
                height: myApplication.hightClc(1426, context),
                width: myApplication.widthClc(1246, context),
              ),
            ),

          )
          : SizedBox(),
          !gotonativ
              ? Positioned(
            left: myApplication.widthClc(20, context),
              bottom: myApplication.hightClc(20, context),
              child: InkWell(
                  onTap: (){
                    _controller!.repeat();
                    setState(() {
                      isanimating = true;

                    });
                    Timer(const Duration(milliseconds: 2250), (){
                      setState(() {
                        gotonativ = true;
                      });
                      _Acontroller!.repeat();
                      Timer(const Duration(milliseconds: 1755), (){
                        myApplication.navigateToRemove(context, main_Screen());
                      });
                    });
                  },
                child: !isanimating
                ? Row(
                  children: [
                    Text(DarkMoodANDtranslationCubit.start,style: TextStyle(color: isdark ? Colors.white : MyColors.mov,fontSize: myApplication.widthClc(40, context)),),
                    Icon(Icons.arrow_forward,color: isdark ? Colors.white : MyColors.mov,size: myApplication.widthClc(40, context),),
                  ],
                )
                    : SizedBox(),
              ))
              : SizedBox(),
        ],
      )

    );
  }
}
