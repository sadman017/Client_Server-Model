import 'package:client_server/constants/size.dart';
import 'package:client_server/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignupForm extends StatelessWidget{
  const SignupForm({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(vertical: formHeight - 10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text(user),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            const Gap(20),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: email,
                hintText: email,
              ),
            ),
            const Gap(20),
            TextFormField(
               decoration: const InputDecoration(
                prefixIcon: Icon(Icons.key_outlined),
                labelText: pass,
                hintText: pass,
                suffixIcon: IconButton(
                  onPressed: null, 
                  icon: Icon(Icons.remove_red_eye_sharp),

                )
              ),
            ),
            const Gap(20),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone_android),
                labelText: number,
                hintText: number,
                border: OutlineInputBorder()
              ),
            ),
            const Gap(20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {
              }, 
              child: Text(signup.toUpperCase()),
              ),
            )
          ],
        ),
    )
    );
  }

}