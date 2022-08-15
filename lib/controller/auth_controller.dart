import 'dart:io';
import 'package:clonetiktok/model/user.dart';
import 'package:clonetiktok/view/screens/Home.dart';
import 'package:clonetiktok/view/screens/auth/login_Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  File? proimg;
  pickImage() async {
      print("Image Picked Successfully");
   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
   if(image == null) return;
   final img = File(image.path);
   this.proimg = img;
  }
  // User State Persistance
  late Rx<User?> _user;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(FirebaseAuth.instance.currentUser);
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user,  _setInitialView);
  }
  _setInitialView(User? user){
    if(user == null){
      Get.offAll(()=> LoginScreen());
    }else{
      Get.offAll(()=>HomeScreen());
    }
  }
  //user register

  void Signup(
      String username, String email, String password, File? image) async {
    try {
      print("Image here");
      print(image.toString() == '');
      print("image here");
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
       String downloadurl = await _uploadProPic(image);

         myUser user = myUser(name: username, profilePhoto: downloadurl, email: email, uid: credential.user!.uid);
         await FirebaseFirestore.instance.collection("users").doc(credential.user!.uid).set(user.toJson());
      }else{
        Get.snackbar("Error Creating Account", "Please enter all the required fields");
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error Occurred", e.toString());
    }
  }

  Future<String> _uploadProPic(File image) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('profilePics')
        .child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String imageDwnUrl = await snapshot.ref.getDownloadURL();
    return imageDwnUrl;
  }
 void Login(String email,String password)async{
    try{
  if(email.isNotEmpty && password.isNotEmpty){
    await  FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }else {
    Get.snackbar("Error Logging In", "Please enter all the field");
  }
    }catch(e){
      Get.snackbar("Error Logging In", e.toString());
    }
  }
}
