
import 'package:flutter/material.dart';
import 'auth.dart';
class USerAuthentication extends StatefulWidget {
  const USerAuthentication({super.key});

  @override
  State<USerAuthentication> createState() => _USerAuthenticationState();
}

class _USerAuthenticationState extends State<USerAuthentication> {
  final _formkey = GlobalKey<FormState>();
  bool isLogin = false;
  String email="";
  String password= "";
  String username = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Email/Password Authetication'),
      ),
      body: Form(
        key: _formkey,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                !isLogin ? TextFormField(
                  key: ValueKey('username'),
                  decoration: InputDecoration(
                      suffixIcon: IconButton(icon: Icon(Icons.account_circle),
                        onPressed: (){},),
                      hintText: 'Enter Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(21)),
                      )
                  ),
                  validator: (value){
                    if(value.toString().length<3) {
                      return 'Username is too short';
                    }
                    else
                    {
                      return null;

                    }
                  },
                  onSaved: (value){
                    setState(() {
                      username=value!;
                    });
                  },
                ): Container(),
                SizedBox(height: 11,),

                TextFormField(

                  key: ValueKey('email'),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(icon: Icon(Icons.email),
                        onPressed: (){},),
                      hintText: 'Enter Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(21)),
                      )
                  ),
                  validator: (value){
                    if(!(value.toString().contains('@'))){
                      return 'Invalid email!!';
                    }else{
                      return null;
                    }
                  },
                  onSaved: (value){
                    setState(() {
                      email=value!;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  key: ValueKey('password'),
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Enter Password",
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye_outlined),
                        onPressed: (){},
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                          borderSide: BorderSide(
                            width: 4,
                          )
                      )
                  ),
                  validator: (value){
                    if(!(value.toString().length>3)){
                      return 'Password is too short';
                    }else{
                      return null;
                    }
                  },
                  onSaved: (value){
                    setState(() {
                      password=value!;
                    });

                  },
                ),
                SizedBox(
                  height: 11,
                ),
                ElevatedButton(onPressed: (){
                  if(_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    isLogin ? signin(email, password) :
                    signup(email, password);
                  }

                }, child:isLogin ? Text('Login'): Text('Signup',selectionColor: Colors.orange,)),
                SizedBox(
                  height: 11,
                ),
                TextButton(onPressed: (){
                  setState(() {
                    isLogin = !isLogin;
                  });
                }, child: isLogin ? Text('Dont have an account? Signup'):
                Text('Alraedy Signed Up? Login '))

              ],
            ),
          ),

        ),
      ),
    );
  }
}
