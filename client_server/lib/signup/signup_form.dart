import 'package:client_server/constants/size.dart';
import 'package:client_server/constants/text_string.dart';
import 'package:client_server/controllers/signup_cotroller.dart';
import 'package:client_server/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignupForm extends StatelessWidget{
   SignupForm({super.key});
  
  final controller = Get.put(SignupController());
  static final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(vertical: formHeight - 10),
      child: Form(
         key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller:  controller.userName,
              decoration: const InputDecoration(
                label: Text(userName),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: email,
                hintText: email,
              ),
            ),
            const Gap(20),
            TextFormField(
               controller: controller.password,
               obscureText: !controller.isPasswordVisible.value,
               decoration:  InputDecoration(
                prefixIcon: const Icon(Icons.key_outlined),
                labelText: pass,
                hintText: pass,
                suffixIcon: Obx(() => IconButton(
                  onPressed: () {
                     controller.togglePasswordVisibility();
                  }, 
                  icon: Icon(  controller.isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,),

                )),
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: controller.mobileNo,
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
                if(_formkey.currentState!.validate()){
                  // SignupController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
                  // SignupController.instance.phoneAuthentication(controller.mobileNo.text.trim());
                  final user = UserModal(email: controller.email.text.trim(), user: controller.userName.text.trim(), password: controller.password.text.trim(), mobileNo: controller.mobileNo.text.trim(),);
                  SignupController.instance.createUser(user);
                }
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