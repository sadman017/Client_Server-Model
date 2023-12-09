import 'package:client_server/constants/size.dart';
import 'package:client_server/constants/text_string.dart';
import 'package:client_server/controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatelessWidget{
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var otp = ' ';
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(defaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(otpTitle, style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,
            fontSize: 70.0,
             ),
             ),
            Text(otpSubTitle.toUpperCase(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 40.0,
            ),
            const Text(
              otpMsg, textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0,),
            OtpTextField(
              mainAxisAlignment: MainAxisAlignment.center,
              numberOfFields: 6,
              fillColor: Colors.transparent.withOpacity(0.1),
              filled: true,
              onSubmit: (code){ otp = code;
              OTPcontroller.instance.verifyOTP(otp);
              },
            ),
            const Gap(20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {
                OTPcontroller.instance.verifyOTP(otp);
              }, child: const Text("Next"),),
            )
          ],
        ),
      ),
    );
  }

}