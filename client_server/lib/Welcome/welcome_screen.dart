import 'package:client_server/constants/colors.dart';
import 'package:client_server/constants/image.dart';
import 'package:client_server/constants/size.dart';
import 'package:client_server/constants/text_string.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return  SafeArea(
      child:Scaffold(
        backgroundColor: isDarkMode ? secondaryColor : primaryColor,
        appBar: AppBar(title: const Text("Client Server App"),
      ),
        body: Container(
          padding: const EdgeInsets.all(defaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(image: const AssetImage(toDo), height: height*0.6,),
             Column(
                children: [
                  Text(welcomeTitle, style: Theme.of(context).textTheme.headlineLarge,),
                  Text(welcomeSubTitle, style: Theme.of(context).textTheme.headlineSmall,textAlign: TextAlign.center,)
               ],
              ),
              Row(
                children: [
                  Expanded(child: OutlinedButton(onPressed: () {}, 
                  style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(),
                  foregroundColor:secondaryColor,
                  side: const BorderSide(color: secondaryColor),
                  padding: const EdgeInsets.symmetric(vertical: buttonHeight),
                  ),
                  child: Text(login.toUpperCase()),
                  )
                  ),
                  const Gap(10),
                  Expanded(child: ElevatedButton(onPressed: (){}, child: Text(signup.toUpperCase()),
                  )
                  )
                ],)
            ],
          ),
        ),
        )
      );
   
  }

}