import 'package:client_server/forget_password/forget_password_otp/otp_screen.dart';
import 'package:client_server/models/user_model.dart';
import 'package:client_server/repository/authentication_repository/authentication_repository.dart';
import 'package:client_server/repository/authentication_repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final userName = TextEditingController();
  final mobileNo = TextEditingController();
  final userRepo = Get.put(UserRepository());
  void registerUser(String email, String password){
   String? error = AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password) as String?;
   if(error != null){
    Get.showSnackbar(GetSnackBar(message: error.toString(),));
   }
    
  }

  Future<void> createUser(UserModal user) async{
    await userRepo.createUser(user);
    phoneAuthentication(user.mobileNo);
    Get.to(() => const OTPScreen());
  }

  void phoneAuthentication(String mobileNo){
    AuthenticationRepository.instance.phoneAuthentication( mobileNo);
  }
}