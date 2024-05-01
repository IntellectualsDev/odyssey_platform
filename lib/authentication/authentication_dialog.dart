import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:odyssey_platform/theme/my_text_styles.dart';
import 'package:odyssey_platform/theme/my_colors.dart';

class AuthenticationDialog extends StatefulWidget {
  const AuthenticationDialog({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  State<AuthenticationDialog> createState() => _AuthenticationDialogState();
}

class _AuthenticationDialogState extends State<AuthenticationDialog> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email = "";
  String password = "";
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: MyColors.background,
      content: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 50, left: 10, right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Welcome",
              style: MyTextStyles.mainTitle(context),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 400,
              child: Text(
                "Enter your email and password to login. If you dont have an account simply enter an email and a password to create your account ",
                textAlign: TextAlign.center,
                style: MyTextStyles.body(context),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text("Email or mobile phone",
                    style: MyTextStyles.body(context)),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onSubmitted: (String value) {
                      email = value;
                      password = passwordController.text;

                      debugPrint("email: $email");
                      debugPrint("password: $password");

                      if (password == "") {
                        setState(() {
                          errorMessage = "Please provide a password";
                        });
                      } else {
                        createAccount(email, password);
                      }
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 20, right: 20),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the radius as needed
                      ),
                      hintText: 'Enter email or mobile',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text("Enter password", style: MyTextStyles.body(context)),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    obscureText: true,
                    obscuringCharacter: "*",
                    onSubmitted: (String value) {
                      password = value;
                      email = emailController.text;
                      debugPrint("email: $email");
                      debugPrint("password: $password");
                      if (email == "") {
                        setState(() {
                          errorMessage = "Please enter an email address";
                        });
                      } else {
                        createAccount(email, password);
                      }
                    },
                    controller: passwordController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 20, right: 20),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the radius as needed
                      ),
                      hintText: 'Password',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            (errorMessage != "")
                ? Text(
                    errorMessage,
                    style: MyTextStyles.errorMessage(context),
                  )
                : Container(),
            (errorMessage != "")
                ? const SizedBox(
                    height: 20,
                  )
                : Container(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.action,
                  elevation: 4,
                ),
                onPressed: () {
                  setState(() {
                    email = emailController.text;
                    password = passwordController.text;
                    debugPrint("email: $email");
                    debugPrint("password: $password");
                    createAccount(email, password);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Log in / Sign up",
                    style: MyTextStyles.buttonText(context),
                  ),
                )),
            //TODO implement google
            // Text("Or", style: MyTextStyles.body(context)),
            // ElevatedButton(
            //     onPressed: () {},
            //     child: Row(
            //       children: [
            //         Icon(FontAwesomeIcons.google),
            //         SizedBox(
            //           width: 50,
            //         ),
            //         Text("Continue with google",
            //             style: MyTextStyles.body(context))
            //       ],
            //     )),
            const SizedBox(
              height: 20,
            ),
            Text(
                "By continuing you agree with the Odysseys terms and conditions and provacy policy",
                style: MyTextStyles.body(context))
          ],
        ),
      ),
    );
  }

  Future<void> createAccount(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      debugPrint("User signed in with email: ${userCredential.user!.uid}");
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        //account found so try to sign in
        debugPrint(
            'The account already exists for that email so now trying to sign in');
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          debugPrint("User signed in with email: ${userCredential.user!.uid}");
          Navigator.of(context).pop();
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            debugPrint('No user found for that email.');
          } else if (e.code == 'invalid-credential') {
            setState(() {
              errorMessage =
                  'User is already registered, but the password does not math';
              print('Wrong password provided for that user.');
            });
          } else {
            setState(() {
              errorMessage = e.code;
            });
          }
        }
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else if (e.code == 'weak-password') {
        setState(() {
          errorMessage = 'Password is too weak';
        });
        print('The password provided is too weak.');
      } else if (e.code == 'invalid-email') {
        setState(() {
          errorMessage = 'Invalid email';
        });
        debugPrint(e.toString());
      } else {
        setState(() {
          errorMessage = e.toString();
        });
        debugPrint(e.toString());
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
      debugPrint(e.toString());
    }
  }
}
