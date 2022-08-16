import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:uuid/uuid.dart';
import 'package:video_compress/video_compress.dart';

class VideoUploadController extends GetxController {
  var uuid = Uuid();


  // 1=>MAin Video Upload
  uploadVideo(String songname, String caption, String videoPath) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    DocumentSnapshot userDoc =
    await FirebaseFirestore.instance.collection("userd").doc(uid).get();
    //VideoId - uuid
    String id = uuid.v1();
    _uploadVideoToStorage(id,videoPath);
    String thumbnail = await _uploadVideoThumbToStarage(id,videoPath);
  }
  // 2=>Video To Storage
  Future<String>_uploadVideoToStorage(String videoId,String videoPath) async {
    Reference reference =
    FirebaseStorage.instance.ref().child("videos").child(videoId);
    UploadTask uploadTask = reference.putFile(await _compressVideo(videoPath));
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;

  }
  // 3=>video Compress
  _compressVideo(String videoPath) async {
    final compressVideo = await VideoCompress.compressVideo(videoPath,
        quality: VideoQuality.MediumQuality);
    return compressVideo!.file;
  }
  // 4=>Video Thumb Gen
  Future<File>_getThumb(String videoPath)async{
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }
  // 5=>Video Thumb To Storage
  _uploadVideoThumbToStarage(String id,String videoPath)async{
    Reference reference =
    FirebaseStorage.instance.ref().child("thumbnail").child(id);
    UploadTask uploadTask = reference.putFile(await _getThumb(videoPath));
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

}
