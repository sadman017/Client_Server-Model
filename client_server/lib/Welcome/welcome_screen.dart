import 'package:client_server/constants/size.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:Scaffold(
      appBar: AppBar(title: const Text("Client Server App"),
      ),
      body: Container(
        padding: const EdgeInsets.all(defaultSize),
      ),
      )
      );
   
  }

}