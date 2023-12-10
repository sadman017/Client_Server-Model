
import 'package:client_server/task/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:random_string/random_string.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
  class _HomeState extends State<Home>{
    bool today= true, tommorow = false, weekend = false;
    bool suggest = false;
    Stream? todoStream;
    getontheload() async{
      todoStream = await DatabaseMethod().getalltheWork(today?"Today":tommorow? "Tommorow":"This Weekend");
      setState((){});
    }

    @override
    void initState(){
      getontheload();
      super.initState();
    }
    Widget allWork(){
      return Container(
        height: 200,
      child: StreamBuilder( builder: (context, AsyncSnapshot snapshot){
        return snapshot.hasData? ListView.builder(padding: EdgeInsets.zero, itemCount: snapshot.data.docs.length, itemBuilder: (context,index){
          DocumentSnapshot ds = snapshot.data.docs[index];
          return CheckboxListTile(
            activeColor: const Color(0xFF279cfb),
            title: Text(ds["Work"], style: const TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w400),
            ),
            value: ds["yes"], onChanged: (newValue)async{
              await DatabaseMethod().updateifTicked(ds["id"],today?"Today":tommorow? "Tommorow":"This Weekend" );
            setState((){
            });
          });
        }):const CircularProgressIndicator();
      }, stream: todoStream,));
    }

    TextEditingController todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        openBox();
      }, child: const Icon(Icons.add, color: Color(0xFF249fff),size: 30.0,),),
      body: Container(
        padding: const EdgeInsets.only(top: 50.0, left: 30.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xff32fda2), Color(0xFF13D8CA), Color(0xFF09adfe)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const Text("Hello\nSadman",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold
            ),
          ),
          const Gap(10),
           const Text("Good Morning",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.w400
            ),
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              today? Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                  decoration:BoxDecoration(color: const Color(0xFF3dffe3),
                  borderRadius: BorderRadius.circular(20)),
                  child: const Text("Today",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ):
              GestureDetector(
                onTap: ()async{
                  today = true;
                  tommorow = false;
                  weekend = false;
                  await getontheload();
                  setState(() {});
                },
                child: const Text("Today",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
              ),
               tommorow? Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                  decoration:BoxDecoration(color: const Color(0xFF3dffe3),
                  borderRadius: BorderRadius.circular(20)),
                  child: const Text("Tommorow",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ):
              GestureDetector(
                onTap: () async {
                  today = false;
                  tommorow = true;
                  weekend = false;
                  await getontheload();
                  setState(() {});
                },
                child: const Text("Tommorow",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
              ),
              weekend? Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                  decoration:BoxDecoration(color: const Color(0xFF3dffe3),
                  borderRadius: BorderRadius.circular(20)),
                  child: const Text("This Weekend",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ):
              GestureDetector(
                onTap: ()async{
                  today = false;
                  tommorow = false;
                  weekend = true;
                  await getontheload();
                  setState(() {});
                },
                child: const Text("This Weekend",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
              ),
            ],
          ),
          const Gap(20),
          allWork(),
        ],)
      )
    );
  }
  Future openBox() => showDialog(context: context, builder: (context)=> AlertDialog(
    content: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Icon(Icons.cancel),
              ),
               const SizedBox(width: 30.0,),
          const Text("Add the work Todo", style: TextStyle(color: Color(0xff008080),
          fontWeight: FontWeight.bold
          ),
          )
            ],
          ),
          const SizedBox(height: 20.0,),
          const Text("Add Text"),
          const SizedBox(height: 10.0,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black38,
                width: 2.0
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(controller: todoController, decoration: const InputDecoration(border: InputBorder.none, hintText: "Enter Text"), ),
          ),
          const SizedBox(height: 20.0,),
          GestureDetector(
            onTap: (){
              String id = randomAlphaNumeric(10);
              Map<String, dynamic> userTodo={
                "Work": todoController.text,
                "Id": id,
                "Yes":false,
              };
              today? DatabaseMethod().addTodayTask(userTodo, id): tommorow? DatabaseMethod().addTommorowTask(userTodo, id): DatabaseMethod().addWeekendTask(userTodo, id);
              Navigator.pop(context);
            },
            child: Center(
              child:Container(
              width: 100,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(color: const Color(0xFF008080),
              borderRadius: BorderRadius.circular(10)
              ),
              child: const Center(child: Text("Add", style: TextStyle(color: Colors.white),
              ),)
              )
            ),
          )
        ],
      ),
    ),
  ));
  }
  
 
