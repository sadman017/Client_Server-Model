import 'package:client_server/home/home.dart';
import 'package:client_server/Welcome/welcome_screen.dart';
import 'package:client_server/repository/authentication_repository/exception/signup_failure.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady(){
    Future.delayed(const Duration(seconds: 5));
    firebaseUser =Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setIntialScreen);
  }

  _setIntialScreen(User? user){
    user == null ? Get.offAll(() => const WelcomeScreen()): Get.offAll(()=> const Home() );
  }

  Future<void> phoneAuthentication(String mobileNo) async{
    await _auth.verifyPhoneNumber(
      phoneNumber: mobileNo,
      verificationCompleted: (credential)  async{
      await _auth.signInWithCredential(credential);
    }, verificationFailed: (e) {
      if(e.code == "invalid-phone-nember"){
        Get.snackbar('Error', 'The number is not valid');
      }
      else{
        Get.snackbar('Error', 'Something went wrong, Try again');
      }
    }, codeSent: (verificationId, resendTOken){
      this.verificationId.value = verificationId;
    }, codeAutoRetrievalTimeout: (verificationId){
      this.verificationId.value = verificationId;
    });
  }

  Future<bool>verifyOTP(String otp) async{
    var credentials = await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true: false;
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() => const Home()): Get.to(() => const WelcomeScreen());
    }on FirebaseAuthException catch(e){
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      debugPrint('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    }
    catch(_){
      const ex = SignUpWithEmailAndPasswordFailure();
      debugPrint('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

   Future<void> loginWithEmailAndPassword(String userName, String password) async{
    try{
      await _auth.signInWithEmailAndPassword(email: userName, password: password);
    }catch(_){}
  }

  Future<void> logout() async => await _auth.signOut();
}