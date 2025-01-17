import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_dart/const/Loginsignpage/loginscreen.dart';
import 'package:test_dart/const/const.dart';
import 'package:test_dart/providers/Auth_provider.dart';


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          
          child: Column(
            
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
               Text( "Create!",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:AppColors.background1
               ),),
              Text( "Account",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:AppColors.background1
              ),),
              Text( "To Start",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: AppColors.background1
              ),),
              SizedBox(height: 30,),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 20,
                  child: TextField(
                    
                  controller: nameController,
                  decoration: InputDecoration(border: InputBorder.none,
                    labelText: "Name"),
                  obscureText: false,
                              ),
                ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 20,
                child: TextField(
                  obscureText: false,
            
                  controller: emailController,
                  decoration: InputDecoration(  border: InputBorder.none,
                    labelText: "Email"),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 20,
                child: TextField(
                  
                  controller: passwordController,
                  decoration: InputDecoration(border: InputBorder.none,
                    labelText: "Password"),
                  obscureText: false,
                ),
              ),
              SizedBox(height: 30,),
              
              ElevatedButton(
                onPressed: () async {
                  try {
                    await authProvider.signUp(emailController.text, passwordController.text);
                    Navigator.pop(context); // Go back to login screen
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sign Up Failed")));
                  }
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.background1
                    ,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                child: SizedBox(
                  width: double.infinity,
                  child: Center(child: Text("Sign Up",style:TextStyle(color: AppColors.white1


                  


                  
                  ),))),
              ),
               TextButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())),
                child: Text("Already have a Account? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
