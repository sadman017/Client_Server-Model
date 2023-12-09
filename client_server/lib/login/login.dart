import 'package:client_server/common_widget/form/form_header.dart';
import 'package:client_server/constants/image.dart';
import 'package:client_server/constants/size.dart';
import 'package:client_server/constants/text_string.dart';
import 'package:client_server/login/login_footer.dart';
import 'package:client_server/login/login_form_widget.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget{
  const Login({super.key});
  
  @override
  Widget build(BuildContext context) {
   final size = MediaQuery.of(context).size;
   return SafeArea(
    child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(defaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormHeaderWidget(size: size,
              image: toDo,
              title:loginTitle,
              ),
              const LoginForm(),
              const LoginFooterWidget(),
            ],
          ),
        ),
      ),
    )
    );
  }
}