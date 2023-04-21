import 'package:Arbaization/Global/vars.dart';
import 'package:Arbaization/helper/app_localization.dart';
import 'package:Arbaization/helper/my_thems.dart';
import 'package:Arbaization/presentation/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'business_logic/darkMoodANDtranslation/dark_mood_AND_translation_cubit.dart';
import 'business_logic/speach_To_text/speach_to_text_cubit.dart';
import 'business_logic/text_Recognition/text_recognition_cubit.dart';
import 'business_logic/text_To_speach/text_to_speach_cubit.dart';


SharedPreferences? Prefs;
String? mood;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Prefs = await SharedPreferences.getInstance();
  mood = Prefs!.getString('mood') ?? "light";
  mood == "dark" ? isdark = true : isdark = false;
  DarkMoodANDtranslationCubit.lang = Prefs!.getString("lang") ?? "en";


  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SpeachToTextCubit()),
        BlocProvider(create: (context) => TextToSpeachCubit()),
        BlocProvider(create: (context) => TextRecognitionCubit()),
        BlocProvider(create: (context) => DarkMoodANDtranslationCubit()),
        BlocProvider(create: (context) => DarkMoodANDtranslationCubit()),


      ],
      child: BlocBuilder<DarkMoodANDtranslationCubit, DarkMoodANDtranslationState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Arabization',
            themeMode: isdark ? ThemeMode.dark : ThemeMode.light,
            theme: Mythems.lighttheme,
            darkTheme: Mythems.darktheme,
            home: Ani_splash(),
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
            ],
            supportedLocales: [
              Locale("en", ""),
              Locale("ar", ""),

            ],
            localeResolutionCallback: (currentLang, supportLang) {
              // if (currentLang != null) {
              //   for (Locale locale in supportLang) {
              //     if (locale.languageCode == currentLang.languageCode) {
              //       Prefs!.setString("lang",currentLang.languageCode) ;
              //       return currentLang;
              //     }
              //   }
              // }
              return supportLang.first;
            },
          );
        },
      ),
    );
  }
}

