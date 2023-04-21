import 'package:Arbaization/Helper/MyApplication.dart';
import 'package:Arbaization/helper/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../Global/vars.dart';
import '../business_logic/darkMoodANDtranslation/dark_mood_AND_translation_cubit.dart';

class aboutUs extends StatelessWidget {
  const aboutUs({Key? key}) : super(key: key);

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
                        ])),
              ),
              Positioned(
                top: myApplication.hightClc(40, context),
                left: myApplication.widthClc(10, context),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: isdark ? Colors.black : Colors.white,
                    size: myApplication.widthClc(30, context),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: myApplication.hightClc(50, context),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: myApplication.widthClc(50, context)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 65,
                          backgroundColor: Colors.transparent,
                          child: Image.asset(
                            "assets/images/1024.png",
                          ),
                        ),
                        SizedBox(height: myApplication.hightClc(20, context),),

                        Text("Arabization App",style: TextStyle(color: Colors.white,fontSize: myApplication.widthClc(30, context),fontWeight: FontWeight.bold),),

                        SizedBox(height: myApplication.hightClc(120, context),),
                        Text("Developer",style:
                        TextStyle(color: isdark ? Colors.black : Colors.white,fontSize: myApplication.widthClc(35, context),fontWeight: FontWeight.bold),),
                        SizedBox(height: myApplication.hightClc(20, context),),
                        Text("Mohamed Refay",style:
                        TextStyle(color: isdark ? Colors.black : Colors.white,fontSize: myApplication.widthClc(22, context),fontWeight: FontWeight.bold),),
                        SizedBox(height: myApplication.hightClc(20, context),),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () async {

                                await launchUrlString("https://www.facebook.com/mohamed.refay.773?mibextid=ZbWKwL",mode: LaunchMode.externalApplication);

                              },                              icon: Icon(FontAwesomeIcons.facebook,size: myApplication.widthClc(30, context)),
                            ),
                            IconButton(
                              onPressed: () async {

                                await launchUrlString("mailto:Mrefayy2000@gmail.com",mode: LaunchMode.externalApplication);

                              },                              icon: Icon(FontAwesomeIcons.google,size: myApplication.widthClc(30, context)),
                            ),

                            IconButton(
                              onPressed: () async {

                                await launchUrlString("https://wa.me/201090287571",mode: LaunchMode.externalApplication);

                              },                                 icon: Icon(FontAwesomeIcons.whatsapp,size: myApplication.widthClc(30, context)),
                            ),
                            IconButton(
                              onPressed: () async {

                                  await launchUrl(Uri.parse("https://instagram.com/mohamed._.refay?igshid=ZDdkNTZiNTM="),mode: LaunchMode.externalApplication);

                              },
                              icon: Icon(FontAwesomeIcons.instagram,size: myApplication.widthClc(30, context)),
                            ),

                          ],),

                        SizedBox(height: myApplication.hightClc(50, context),),
                        Text("U I",style:
                        TextStyle(color: isdark ? Colors.black : Colors.white,fontSize: myApplication.widthClc(35, context),fontWeight: FontWeight.bold),),
                        SizedBox(height: myApplication.hightClc(20, context),),
                        Text("Mahmoud Ali",style:
                        TextStyle(color: isdark ? Colors.black : Colors.white,fontSize: myApplication.widthClc(22, context),fontWeight: FontWeight.bold),),
                        SizedBox(height: myApplication.hightClc(20, context),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () async {

                                await launchUrlString("https://www.facebook.com/akoky252?mibextid=ZbWKwL",mode: LaunchMode.externalApplication);

                              },                              icon: Icon(FontAwesomeIcons.facebook,size: myApplication.widthClc(30, context)),
                            ),
                            IconButton(
                              onPressed: () async {

                                await launchUrlString("mailto:Mahmoudxali74@gmail.com",mode: LaunchMode.externalApplication);

                              },                              icon: Icon(FontAwesomeIcons.google,size: myApplication.widthClc(30, context)),
                            ),

                            IconButton(
                              onPressed: () async {

                                await launchUrlString("https://wa.me/201141578409",mode: LaunchMode.externalApplication);

                              },                                 icon: Icon(FontAwesomeIcons.whatsapp,size: myApplication.widthClc(30, context)),
                            ),
                            IconButton(
                              onPressed: () async {

                                await launchUrl(Uri.parse("https://instagram.com/mavmud_0?igshid=YmMyMTA2M2Y="),mode: LaunchMode.externalApplication);

                              },
                              icon: Icon(FontAwesomeIcons.instagram,size: myApplication.widthClc(30, context)),
                            ),

                          ],),


                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
