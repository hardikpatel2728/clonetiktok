import 'package:cloud_firestore/cloud_firestore.dart';

class Video{
  String username;
  String uid;
  String id;
  List likes;
  int CommentsCount;
  int shareCount;
  String songName;
  String caption;
  String videoUrl;
  String thumbnail;
  String profilePic;

  Video({
    required  this.username,
  required  this.uid ,
  required  this.id ,
  required  this.likes ,
  required  this.CommentsCount ,
  required  this.shareCount ,
  required  this.songName ,
  required  this.caption ,
  required  this.videoUrl ,
  required  this.thumbnail ,
  required  this .profilePic,
});
  Map<String,dynamic> toJson() => {

    "username" : username,
    "uid" : uid,
    "id" : id,
    "likes" : likes,
    "CommentsCount" : CommentsCount,
    "shareCount": shareCount,
    "songName": songName,
    "caption": caption,
    "videoUrl": videoUrl,
    "thumbnail": thumbnail,
    "profilePic": profilePic,
  };

  //firebase - app(user)
  static Video fromSnap(DocumentSnapshot snap){
    var sst = snap.data()as Map<String,dynamic>;
    return Video(
      username: sst['username'],
      uid: sst["uid"],
      id: sst['id'],
      likes: sst['likes'],
      CommentsCount :sst['CommentsCount'],
      shareCount :sst['shareCount'],
      songName :sst['songName'],
      caption:sst['caption'],
      videoUrl :sst['videoUrl'],
      thumbnail:sst['thumbnail'],
      profilePic:sst['profilePic'],
    );
  }
}