import 'package:flutter/material.dart';
import 'package:volunify_bb/main.dart';
import 'package:volunify_bb/pages/common/buttons.dart';
import 'package:volunify_bb/pages/common/colors.dart';
import 'package:volunify_bb/pages/common/fonts.dart';
import 'package:volunify_bb/pages/common/textField.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> _register() async {
    final String role = nameController.text.trim();
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    final String confirmPassword = confirmPasswordController.text.trim();

    // Check if passwords match
    if (password != confirmPassword) {

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Passwords do not match'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    final AuthResponse response = await supabase.auth.signUp(
                  email: email,
                  password: password
                );

  
    if (response.session != null) {
        Navigator.pushNamed(context, '/login');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Registration error: '),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppFonts.heading('Create an Account', AppColor.primaryColor),
              SizedBox(height: 40,),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFields.textField('Name of the Organization', Icons.person, false, nameController),
              ),
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFields.textField('Email', Icons.email, false, emailController),
              ),
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFields.textField('Password', Icons.lock, true, passwordController),
              ),
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFields.textField('Confirm Password', Icons.lock, true, confirmPasswordController),
              ),
              SizedBox(height: 20,),
              Button.formButtton('Sign Up', _register, MediaQuery.of(context).size.width * 0.8),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppFonts.customizeText('Already a Member?', AppColor.textColor, 12, FontWeight.normal),
                  Button.textButton(
                    'Login',
                        () {
                      Navigator.pushNamed(context, '/login');
                    },
                    12,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
