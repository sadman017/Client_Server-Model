import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
  class _HomeState extends State<Home>{
    bool today= true, tommorow = false, weekend = false;
    bool suggest = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){

      }, child: const Icon(Icons.add, color: Color(0xFF249fff),size: 30.0,),),
      body: Container(
        padding: const EdgeInsets.only(top: 50.0, left: 30.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xff232fda2), Color(0xFF13D8CA), Color(0xFF09adfe)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
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
                onTap: (){
                  today = true;
                  tommorow = false;
                  weekend = false;
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
                onTap: (){
                  today = false;
                  tommorow = true;
                  weekend = false;
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
                onTap: (){
                  today = false;
                  tommorow = false;
                  weekend = true;
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
          CheckboxListTile(
            activeColor: const Color(0xFF279cfb),
            title: const Text("Finish Project", style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w400),),
            value: suggest, onChanged: (newValue){
            setState((){
              suggest = newValue!;
            });
          })
        ],)
      )
    );
  }
  }

