import 'dart:io';
import 'package:clonetiktok/constants.dart';
import 'package:clonetiktok/controller/Upload_video_Controller.dart';
import 'package:clonetiktok/view/widget/text_input.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

class addCaption_screen extends StatefulWidget {
  File videoFile;
  String videoPath;

  addCaption_screen(
      {Key? key, required this.videoFile, required this.videoPath})
      : super(key: key);

  @override
  State<addCaption_screen> createState() => _addCaption_screenState();
}

class _addCaption_screenState extends State<addCaption_screen> {
  late VideoPlayerController videoPlayerController;
  TextEditingController songNameController = TextEditingController();
  TextEditingController captionController = TextEditingController();
  VideoUploadController videoUploadController = Get.put(VideoUploadController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      videoPlayerController = VideoPlayerController.file(widget.videoFile);
    });
    videoPlayerController.initialize();
    videoPlayerController.play();
    videoPlayerController.setLooping(true);
    videoPlayerController.setVolume(0.7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.4,
              width: MediaQuery.of(context).size.width,
              child: VideoPlayer(videoPlayerController),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              height: MediaQuery.of(context).size.height/4,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextInputField(
                      controller: songNameController,
                      myIcon: Icons.music_note,
                      myLableText: "Song Name"),
                  SizedBox(height: 20,),
                  TextInputField(
                      controller: captionController,
                      myIcon: Icons.closed_caption,
                      myLableText: "Caption"),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: () {
                      videoUploadController.uploadVideo(songNameController.text, captionController.text, widget.videoPath);
                  }, child: Text("Upload"),style: ElevatedButton.styleFrom(primary: buttonColor)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
