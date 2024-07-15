import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/DataBase.dart';
import 'package:to_do_app/utils/DialogBox.dart';
import 'package:to_do_app/utils/TodoTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}


class HomePageState extends State<HomePage> {

  ///Referencing Hive Box\
  final myBox = Hive.box("myBox");

  DataBase DB = DataBase();


  @override
  void initState() {
    final myBox = Hive.box("myBox");

    // if the user is opening the app first time ever

    if(myBox.get("TodoList") == null){
      DB.CreateInitialData();
    }
    else{
      DB.LoadData();
    }

  }

  final Txtcontroller = TextEditingController();
///DataBase


///Changing CheckBox
  ChangeCheckBox(  bool? value,int index){
    setState(() {
      DB.toDoList[index][1] = !DB.toDoList[index][1];


    });}

  ///Saving New Task
  SaveNewTask(){
    int i;
    setState(() {
  DB.toDoList.add([Txtcontroller.text.toString(),false]);
  Txtcontroller.clear();

  });
    Navigator.of(context).pop();

    DB.UpdateData();
  }

  ///Deleting  Task
  DeleteTask(int index){

    setState(() {
      if(DB.toDoList[index][1] == true){
      DB.toDoList.removeAt(index);}
      else{
        const AlertDialog(
          content: Text("Select First")
        );
      }
    });
    DB.UpdateData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        backgroundColor: Colors.orange[300],
        title:const Text("ToDo App"),

            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: (){
          showDialog(context: context, builder: (context) {
            return DialogBox(
                Txtcontroller: Txtcontroller ,
                onSave: SaveNewTask,
                onCancel: (){Navigator.of(context).pop();});


          },
          );

        },
        child: const Icon(Icons.add),
      ),

      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Colors.yellow[300],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(
              height: 40,
            ),

            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text("All ToDos",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
            ),

            Expanded(
              child: ListView.builder(


                itemCount: DB.toDoList.length,

                itemBuilder: (context, index) {
                  return Container(

                      margin: const EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 10),
                      child: TodoTile(taskName: DB.toDoList[index][0], taskSelected: DB.toDoList[index][1], onChanged:(value){  ChangeCheckBox(value,index);},
                        DeleteBtn: (){
                        DeleteTask(index);

                        }

                      ));
                  },)
              
              ),


          ],
        ),
        
      ),
    );
  }
}
