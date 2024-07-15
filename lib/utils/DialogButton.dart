import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget{
  String btnText;
  VoidCallback? onPressed;


  DialogButton(
  {super.key, required this.btnText,required this.onPressed ,}
      );


  @override
  Widget build(BuildContext context) {

    return MaterialButton(onPressed: onPressed,
      color: Colors.orange[300],
      child: Text(btnText),


    );
  }

}