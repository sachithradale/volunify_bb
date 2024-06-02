import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:volunify_bb/main.dart';
import 'package:volunify_bb/pages/common/buttons.dart';
import 'package:volunify_bb/pages/common/colors.dart';
import 'package:volunify_bb/pages/common/fonts.dart';
import 'package:volunify_bb/pages/common/textfield.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> _login() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
  
    try {
      // final response = await Supabase.instance.client.auth.signInWithPassword(
      //   email: email,
      //   password: password,
      // );

      if(email == "nadeesha@gmail.com" && password == "123456"){
        Navigator.pushNamed(context, '/home');
      }else if(email == "pasindu@gmail.com" && password == "123456"){
        Navigator.pushNamed(context, '/homeVol');
      }else{
        _showErrorDialog();
      }

      // if (response.user != null) {
      //   // Login successful
      //   if (response.user?.appMetadata['role'] == 'volunteer') {
      //     Navigator.pushNamed(context, '/volHome');
      //   } else {
      //     Navigator.pushNamed(context, '/orgHome');
      //   }
      // } else {
      //   // Login failed
      //   _showErrorDialog();
      // }
    } catch (error) {
      // Error during login
      _showErrorDialog();
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Error',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          content: Text("Username and password do not match"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppFonts.heading('Welcome Back!', AppColor.primaryColor),
              SizedBox(height: 20),
              AppFonts.subtitle('Login to continue', AppColor.textColor),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFields.textField(
                  'Email',
                  Icons.email,
                  false,
                  emailController,
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFields.textField(
                  'Password',
                  Icons.lock,
                  true,
                  passwordController,
                ),
              ),
              SizedBox(height: 20),
              Button.formButtton(
                'Login',
                _login,
                MediaQuery.of(context).size.width * 0.8,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppFonts.customizeText(
                    "Don't have an account?",
                    AppColor.textColor,
                    12,
                    FontWeight.normal,
                  ),
                  Button.textButton(
                    'Sign Up',
                    () {
                      Navigator.pushNamed(context, '/register');
                    },
                    12,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
