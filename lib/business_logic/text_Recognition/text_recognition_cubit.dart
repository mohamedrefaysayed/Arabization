import 'package:Arbaization/Global/vars.dart';
import 'package:Arbaization/helper/MyColors.dart';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
part 'text_recognition_state.dart';

class TextRecognitionCubit extends Cubit<TextRecognitionState> {
  static XFile? imageFile;
  static XFile? pickedImage;
  static String scannedText = "";
  static bool textScanning = false;
  final textRecognizer = TextRecognizer();
  static bool inResult = false;


  TextRecognitionCubit() : super(TextRecognitionInitial());

  void getRecognisedText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final recognisedText = await textRecognizer.processImage(inputImage);
    await textRecognizer.close();
    TextRecognitionCubit.scannedText = "";
    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        TextRecognitionCubit.scannedText = TextRecognitionCubit.scannedText + line.text + "\n";
      }
    }
    textScanning = false;
    emit(TextRecognitionResult());
  }

  void getImage(ImageSource source) async {
    try {
      pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {

        textScanning = true;
        imageFile = await _cropImage(image: pickedImage!);;
        emit(TextRecognitionInitial());
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      scannedText = "Error occured while scanning";
      emit(TextRecognitionInitial());
    }
  }

  Future <XFile?> _cropImage({required XFile image})async{
    CroppedFile? croppedImage = await ImageCropper().cropImage(sourcePath: image.path,
        uiSettings: [
        AndroidUiSettings(
        toolbarTitle: 'Edit Photo',
        backgroundColor: isdark ? Colors.black : Colors.white,
        activeControlsWidgetColor: MyColors.mov,
        cropFrameColor: MyColors.mov,
        cropGridColor: MyColors.mov,
        toolbarColor: isdark ? Color(0xff1B1B1B) : Colors.white,
        toolbarWidgetColor: MyColors.mov,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false
    ),
    ]
    );
    if(croppedImage == null) return null;
    return XFile(croppedImage.path);

  }



  reset(){
    scannedText = "";
    imageFile = null;
    inResult = false;
    emit(TextRecognitionInitial());
  }

  getinit(){
    emit(TextRecognitionInitial());

  }

}
