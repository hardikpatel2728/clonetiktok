import 'package:clonetiktok/view/widget/text_input.dart';
import 'package:flutter/material.dart';
import '../../widget/glitch.dart';

class SignupScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController setpasswordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap method for remove keyboard while touch on screen
      onTap: ()=>FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(margin: EdgeInsets.only(top: 100),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GlithEffect(
                    child: Text(
                  "Welcome to Person Vidz ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                )),
                SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    const CircleAvatar(
                      backgroundImage:NetworkImage("https://st3.depositphotos.com/1767687/16607/v/450/depositphotos_166074422-stock-illustration-default-avatar-profile-icon-grey.jpg") ,
                      radius: 60,
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white
                          ),
                            child: Icon(
                          Icons.edit,
                          size: 30,
                              color: Colors.black,
                        )))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextInputField(
                      controller: usernameController,
                      myIcon: Icons.person,
                      myLableText: "User Name"),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextInputField(
                      controller: emailController,
                      myIcon: Icons.email,
                      myLableText: "Email"),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextInputField(
                    controller: setpasswordController,
                    myIcon: Icons.lock,
                    myLableText: "Set Password",
                    toHide: true,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextInputField(
                      controller: confirmpasswordController,
                      myIcon: Icons.lock,
                      myLableText: "Confirm Password"),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        child: Text("Sign Up")))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
