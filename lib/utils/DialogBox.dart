import 'package:flutter/material.dart';

import 'DialogButton.dart';

class DialogBox extends StatelessWidget{
  final Txtcontroller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({super.key, required this.Txtcontroller ,required this.onSave,required this.onCancel});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: Txtcontroller,
              decoration: const InputDecoration(
                hintText: "Enter a new Task",
                prefixIcon: Icon(Icons.edit),
                border: OutlineInputBorder()
              )

            ),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DialogButton(btnText: "Save", onPressed: onSave),
                DialogButton(btnText: "Cancel", onPressed:onCancel)
              ],
            )


          ],

        ),
      ),

    );
  }

}