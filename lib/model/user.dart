import 'package:cloud_firestore/cloud_firestore.dart';

class myUser {
  String name;
  String profilePhoto;
  String email;
  String uid;

  myUser({
    required this.name,
    required this.profilePhoto,
    required this.email,
    required this.uid,
  });

  //app - firebase(map)
  Map<String,dynamic> toJson() => {

      "name" : name,
      "profilePic" : profilePhoto,
      "email" : email,
      "uid" : uid,
    };

  //firebase - app(user)
  static myUser fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data()as Map<String,dynamic>;
    return myUser(
      email: snapshot['email'],
      profilePhoto: snapshot["profilePic"],
      uid: snapshot['uid'],
      name: snapshot['name'],
    );
  }
}
