import 'package:client_server/constants/size.dart';
import 'package:client_server/constants/text_string.dart';
import 'package:client_server/forget_password/forget_password_option/forget_password_modal_bottom_sheet.dart';
import 'package:client_server/home/home.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget{
  const LoginForm({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: formHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                labelText: userName,
                hintText: userName,
                border: OutlineInputBorder()
              ),
            ),
            const Gap(20),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.key_outlined),
                labelText: pass,
                hintText: pass,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(onPressed: null, icon: Icon(Icons.remove_red_eye_rounded),
                )
              ),
            ),
            const Gap(20),
            Align(
              alignment:Alignment.centerRight,
              child: TextButton(
                onPressed: () { ForgetPasswordScreen.buildShowModalBottomSheet(context); },
                child: const Text(forgetPass)
                ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){Get.to(const Home());}, child: Text(login.toUpperCase()),
              ),
            )
          ],
        ),
         ),
        );
  }
}