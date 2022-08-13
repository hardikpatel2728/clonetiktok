import 'package:clonetiktok/view/widget/text_input.dart';
import 'package:flutter/material.dart';

import '../../widget/glitch.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlithEffect(child: Text("Person Vidz",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),)),
            SizedBox(height: 30,),
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
                controller: passwordController,
                myIcon: Icons.lock,
                myLableText: "Password",
                toHide: true,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {},
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: Text("Login")))
          ],
        ),
      ),
    );
  }
}
