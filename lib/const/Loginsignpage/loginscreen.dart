import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_dart/const/Loginsignpage/Signupscreen.dart';
import 'package:test_dart/const/const.dart';
import 'package:test_dart/providers/Auth_provider.dart';
import 'package:test_dart/screens/home_screen.dart';
// import 'package:test_dart/screens/subjects_screen.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( "Hello!",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: AppColors.background1
              ),),
              Text( "Login To",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:AppColors.background1
              ),),
              Text( "Continue",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: 
              AppColors.background1),),
          
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 20,
                child: TextField(
                  obscureText: false,
                  
                  controller: emailController,
                  
                  decoration: InputDecoration(border: InputBorder.none,
                    labelText: "Email"),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 20,
                child: TextFormField(
                  
                  
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Password"),
                  obscureText: false,
                ),
              ),
             
              ElevatedButton(
                onPressed: () async {
                  try {
                    await authProvider.login(emailController.text, passwordController.text);
          
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Failed")));
                  }
                },
                 
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.background1,
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Center(child: Text("Login",style: TextStyle(color: AppColors.white1),))),
             
              ),
              TextButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen())),
                child: Text("Don't have an account? Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

