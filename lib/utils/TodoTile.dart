
import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  String? taskName;
  bool taskSelected;
  Function(bool?)? onChanged;
  VoidCallback DeleteBtn;

  TodoTile({super.key, required this.taskName, required this.taskSelected, required this.onChanged,required this.DeleteBtn});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          color: Colors.orange[300],
        borderRadius: BorderRadius.circular(11)
      ),
      height: 70,
      width: double.maxFinite,

      child: Center(
        child: ListTile(
          leading: Checkbox(value: taskSelected ,onChanged: onChanged,checkColor: Colors.orange,activeColor: Colors.yellow,),
          title: Text(taskName.toString(),style: TextStyle(decoration: taskSelected
          ? TextDecoration.lineThrough : TextDecoration.none
          ),),
          trailing: Container(
            width: 50,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: Colors.red[300],
            ),
            child: IconButton(
              icon: Icon(Icons.delete,color: Colors.yellow[100],),
              onPressed: DeleteBtn

            ),
          ),


        ),
      ),
    );
  }


}