import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:odyssey_platform/theme/my_colors.dart';
import 'package:odyssey_platform/theme/my_text_styles.dart';
import 'package:odyssey_platform/globals.dart' as globals;

class Avatar extends StatefulWidget {
  final VoidCallback onPressed;
  final String? imageUrl; //nullable so that

  const Avatar({Key? key, required this.onPressed, this.imageUrl})
      : super(key: key);

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return IconButton(
          onPressed: () {
            // Get the RenderBox of the avatar button
            RenderBox renderBox = context.findRenderObject() as RenderBox;
            // Calculate the position to show the pop-up menu below the avatar button
            Offset offset = renderBox.localToGlobal(Offset.zero);
            double buttonHeight = renderBox.size.height;
            showMenu(
              context: context,
              position: RelativeRect.fromLTRB(
                offset.dx,
                offset.dy + buttonHeight,
                offset.dx + renderBox.size.width,
                offset.dy +
                    buttonHeight *
                        2, // Adjust as needed for the desired height of the menu
              ),
              items: <PopupMenuEntry<int>>[
                PopupMenuItem<int>(
                    value: 1,
                    child: ListTile(
                      title: CircleAvatar(
                        backgroundColor: MyColors.action,
                        backgroundImage: widget.imageUrl != null
                            ? NetworkImage(widget.imageUrl!)
                            : null,
                        radius: 20,
                        child: widget.imageUrl == null
                            ? Icon(
                                Icons.person,
                              )
                            : null,
                      ),
                    )),
                PopupMenuItem<int>(
                  value: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        globals.userEmail!,
                        style: MyTextStyles.bodyDark(context),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.settings),
                      SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        child: Text('Settings', style: MyTextStyles.textButton(context),),
                        onPressed: () {}
                        ,
                      )
                    ],
                  ),
                ),
                 PopupMenuItem<int>(
                  value: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.logout_rounded),
                      SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        child:  Text('Logout', style: MyTextStyles.textButton(context),),
                        onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        setState(() {
                          globals.signedIn.value = false;
                          Navigator.pop(context);
                        });
                      },
                        
                      )
                    ],
                  ),
                  onTap: () async { //en el on tap se cierra solito 
                        await FirebaseAuth.instance.signOut();
                        setState(() {
                          globals.signedIn.value = false;
                          
                        });
                      },
                ),
              
              ],
            );
          },
          icon: CircleAvatar(
            backgroundColor: MyColors.action,
            backgroundImage:
                widget.imageUrl != null ? NetworkImage(widget.imageUrl!) : null,
            radius: 20, // Adjust the radius as needed
            child: widget.imageUrl == null
                ? Icon(Icons.person)
                : null, // Use default icon if no image URL provided
          ),
        );
      },
    );
  }
}
