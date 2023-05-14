
import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import 'package:flutter_contact/MyHomePage.dart';




import 'main.dart';



class LoginPage extends StatefulWidget {


  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  static const String KEYNAME="EMAIL";
  static const String KEYNAME2="PASSWORD";
  var nameValue= "No Value Saved";
  @override
  void initState() {

    super.initState();
    getValue();
  }

  var emailText= TextEditingController();

  var passText= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          title: Text("Login Page")
      ),


      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              TextField(
                controller: emailText,
                decoration: InputDecoration(label: Text("Email"),
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(21),
                      borderSide: BorderSide(color: Colors.deepOrange)
                  ),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: BorderSide(color: Colors.deepOrange)
                  ),
                  // suffixText: "Username Exists",
                  suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye),
                      onPressed: () {
                        print("Hello");
                      }),
                  prefixIcon: Icon(Icons.email),
                ),
              ),

              Container(
                width: 40,
                height: 20,

              ),


              TextField(
                controller: passText,
                decoration: InputDecoration(label:Text("Input Password"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: BorderSide(color: Colors.deepOrange)
                    )
                ),
              ),
              ElevatedButton(onPressed:
                  () async {

                String uEmail = emailText.text.toString();
                String uPass = passText.text.toString();
                var sharedPrefs = await SharedPreferences.getInstance();
                sharedPrefs.setBool(SplashPageState.KEYLOGIN, true);
                sharedPrefs.setString(KEYNAME, emailText.text.toString());
                sharedPrefs.setString(KEYNAME2, passText.text.toString());




                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => MyHomePage(title:"Home Screen"),));

              }, child:Text("Login"),

              )



            ],
          ),),),


    );
  }


  void getValue() async {
    var prefs = await SharedPreferences.getInstance();
    var getName = prefs.getString(KEYNAME);
    nameValue = getName != null ? getName : "No Value saved";
    setState(() {

    });
  }
}








