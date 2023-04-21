import 'package:Arbaization/Global/vars.dart';
import 'package:Arbaization/helper/MyApplication.dart';
import 'package:Arbaization/helper/MyColors.dart';
import 'package:Arbaization/presentation/aboutUs.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../business_logic/darkMoodANDtranslation/dark_mood_AND_translation_cubit.dart';

class settings extends StatelessWidget {
  settings({Key? key}) : super(key: key);

  final List<String> langs = ['العربية', 'English'];
  String? selectedValue = DarkMoodANDtranslationCubit.lang == "ar" ? "العربية" : "English";


  @override
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
                    height: myApplication.hightClc(200, context),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(myApplication.widthClc(50, context)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: myApplication.hightClc(60, context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            border: Border.all(
                              color: isdark ? Colors.black : Colors.white,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                            Text(
                              DarkMoodANDtranslationCubit.languge,
                              style: TextStyle(
                                  color: isdark ? Colors.black : Colors.white,
                                  fontSize: myApplication.widthClc(20, context)),
                            ),
                            DarkMoodANDtranslationCubit.lang == "ar " ? SizedBox(width: myApplication.widthClc(100, context),) : SizedBox(),
                            DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                dropdownStyleData: DropdownStyleData(
                                    maxHeight: myApplication.hightClc(120, context),
                                    width: myApplication.widthClc(120, context),
                                    padding: null,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: isdark ? Colors.black : Colors.white,
                                    ),
                                    elevation: 8,
                                    scrollbarTheme: ScrollbarThemeData(
                                      radius:  Radius.circular(40),
                                      thickness: MaterialStateProperty.all(myApplication.widthClc(6, context)),
                                      thumbVisibility: MaterialStateProperty.all(true),
                                    )),
                                iconStyleData:  IconStyleData(
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                  ),
                                  iconSize: myApplication.widthClc(25, context),
                                  iconEnabledColor: !isdark ? Colors.black : Colors.white,
                                ),
                                buttonStyleData: ButtonStyleData(
                                  height: myApplication.hightClc(50, context),
                                  width: myApplication.widthClc(120, context),
                                  padding:  EdgeInsets.only(left: myApplication.widthClc(14, context), right:  myApplication.widthClc(14, context)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: isdark ? Colors.black : Colors.white,
                                    ),
                                    color: isdark ? Colors.black : Colors.white,
                                  ),
                                  elevation: 2,
                                ),
                                items: langs
                                  .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style:  TextStyle(
                          fontSize: myApplication.widthClc(14, context),
                          fontWeight: FontWeight.bold,
                          color: !isdark ? Colors.black : Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                      .toList(),
                                onChanged: (v) {
                                  v =="العربية"
                                  ? DarkMoodANDtranslationCubit.lang = "ar"
                                  : DarkMoodANDtranslationCubit.lang = "en";
                                  selectedValue = v;
                                  BlocProvider.of<DarkMoodANDtranslationCubit>(context).update();
                                },
                                value: selectedValue,
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: myApplication.hightClc(35, context),
                        ),
                        Container(
                          height: myApplication.hightClc(60, context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            border: Border.all(
                              color: isdark ? Colors.black : Colors.white,
                            ),
                          ),
                          child: Row(children: [
                            SizedBox(
                              width: myApplication.widthClc(50, context),
                            ),
                            Text(
                              DarkMoodANDtranslationCubit.darkmood,
                              style: TextStyle(
                                  color: isdark ? Colors.black : Colors.white,
                                  fontSize: myApplication.widthClc(20, context)),
                            ),
                            SizedBox(
                              width: myApplication.widthClc(50, context),
                            ),
                            BlocBuilder<DarkMoodANDtranslationCubit, DarkMoodANDtranslationState>(
                              builder: (context, state) {
                                return Switch(
                                  value: DarkMoodANDtranslationCubit.val,
                                  onChanged: (v) async {
                                    DarkMoodANDtranslationCubit.val = v;
                                    BlocProvider.of<DarkMoodANDtranslationCubit>(context)
                                        .changeMood();
                                    final Prefs =
                                        await SharedPreferences.getInstance();
                                    Prefs.setString(
                                        "mood", isdark ? "dark" : "light");
                                  },
                                  activeColor: Colors.black,
                                  inactiveThumbColor: Colors.grey,
                                );
                              },
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: myApplication.hightClc(330, context),
                        ),


                        InkWell(
                          onTap: (){
                            myApplication.navigateTo(aboutUs(), context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: isdark ? Colors.black : Colors.white,)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(DarkMoodANDtranslationCubit.aboutUs,style:
                              TextStyle(color: isdark ? Colors.black : Colors.white,fontSize: myApplication.widthClc(20, context),fontWeight: FontWeight.bold),),
                            ),
                          ),
                        )
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
