import 'package:dbtestproject3it1/Screen/login.dart';
import 'package:dbtestproject3it1/Screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = 'W_c';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future<bool> exit(){
      return showDialog(context: context, builder: (context) => AlertDialog(

        buttonPadding: const EdgeInsets.only(left: 20,right: 20),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: Colors.blueGrey[700],
        title: Text('Are you sure'),
        titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 20),
        content: Text('Do you want to exit'),
        contentTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 15),
        elevation: 2.0,
        actions: [
          MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.green,

              child: Text('Yes',style: TextStyle(color: Colors.white,fontSize: 15),),
              onPressed: (){SystemNavigator.pop();}

          ),

          //SizedBox(width: size.width * 0.3,),

          MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.green,

              child: Text('No',style: TextStyle(color: Colors.white,fontSize: 15),),
              onPressed: (){Navigator.of(context).pop();}
          ),
        ],
      ));
    }

    return WillPopScope(
      onWillPop: () { exit(); },
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) => LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                colors: [Colors.black,Colors.transparent]
            ).createShader(rect),
            blendMode: BlendMode.darken,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/chiron2.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
                  )
              ),
            ),
          ),

          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Flexible(
                    child: Center(
                      child: Text('Welcome',style: TextStyle(color: Colors.white,fontSize: size.width * 0.1,fontWeight: FontWeight.w500),),
                    )),

                Container(
//                width: double.infinity,
//                padding: EdgeInsets.all(16),
                  child: Column(
                    children: [

                      Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.green,
                        ),
                        child: MaterialButton(
                          child: Text('Log in',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                          onPressed: (){
                            Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                          },
                        ),
                      ),

                      SizedBox(
                        height: size.height * 0.02,
                      ),

                      Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.green,
                        ),
                        child: MaterialButton(
                          child: Text('Register',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                          onPressed: (){
                            Navigator.of(context).pushReplacementNamed(SignupScreen.routeName);
                          },
                        ),
                      ),

                      SizedBox(
                        height: size.height * 0.05,
                      ),

                      Container(
                        child: Text('Open your new world together with us',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),

                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                  width: 1, color: Colors.white,
                                )
                            )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
