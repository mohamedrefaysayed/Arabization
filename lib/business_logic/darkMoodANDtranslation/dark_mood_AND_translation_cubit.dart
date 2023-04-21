import 'package:Arbaization/Global/vars.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'dark_mood_AND_translation_state.dart';

class DarkMoodANDtranslationCubit extends Cubit<DarkMoodANDtranslationState> {
  static bool val = isdark;

  static String? lang;
  static String start = lang == "ar" ? "البدء" : "Start";
  static String languge = lang == "ar" ? "اللغة" : "Language";
  static String darkmood = lang == "ar" ? "الوضع المظلم" : "Dark mood";
  static String texttospeach = lang == "ar" ? "من كلام الى صوت" : "Text To Speach";
  static String speachtotext = lang == "ar" ? "من صوت الى كلام" : "Speach To Text";
  static String textrecognition = lang == "ar" ? "التعرف على الكلام" : "Text Recognition";
  static String trasform = lang == "ar" ? "تحويل" : "Transform";
  static String noarabicwarning = lang == "ar" ? "يدعم فقط أي لغة أحرف لاتينية (لا يدعم العربية)" : "It only supports any Latin-based character language (no arabic)";
  static String process = lang == "ar" ? "معالجة" : "Process";
  static String gallery = lang == "ar" ? "المعرض" : "Gallery";
  static String camera = lang == "ar" ? "الكاميرا" : "Camera";
  static String aboutUs = lang == "ar" ? "معلومات عننا" : "About us";

  DarkMoodANDtranslationCubit() : super(DarkMoodInitial());


  changeMood(){
    isdark = val;
    emit(DarkMoodInitial());
  }
  update()async{

    start = lang == "ar" ? "البدء" : "Start";
    languge = lang == "ar" ? "اللغة" : "Language";
    darkmood = lang == "ar" ? "الوضع المظلم" : "Dark mood";
    texttospeach = lang == "ar" ? "من كلام الى صوت" : "Text To Speach";
    speachtotext = lang == "ar" ? "من صوت الى كلام" : "Speach To Text";
    textrecognition = lang == "ar" ? "التعرف على الكلام" : "Text Recognition";
    trasform = lang == "ar" ? "تحويل" : "Transform";
    noarabicwarning = lang == "ar" ? "يدعم فقط أي لغة أحرف لاتينية (لا يدعم العربية)" : "It only supports any Latin-based character language (no arabic)";
    process = lang == "ar" ? "معالجة" : "Process";
    gallery = lang == "ar" ? "المعرض" : "Gallery";
    camera = lang == "ar" ? "الكاميرا" : "Camera";
    aboutUs = lang == "ar" ? "معلومات عننا" : "About us";

    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("lang", lang!);
    emit(DarkMoodInitial());
  }

}
