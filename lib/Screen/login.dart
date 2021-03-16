import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home.dart';
import 'signup_screen.dart';
import 'package:provider/provider.dart';
import '../models/authentication.dart';


class LoginScreen extends StatefulWidget {
  static const routeName = '/';
  
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey =  GlobalKey();
  bool setPassword = true;

  Map<String, String> _authData = {
    'email' : '',
    'password' : ''
  };

  void _showErrorDialog(String msg)
  {
    showDialog(context: context,
      builder: (context) => AlertDialog(
        title: Text('ເກີດຂໍ້ຜິດພາດ',style: TextStyle(fontWeight: FontWeight.bold),),
        content: Text(msg),
        actions: [
          MaterialButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text('ຕົກລົງ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
          )
        ],
      )
    );
  }

  Future<void> _submit() async
  {
    if(!_formKey.currentState.validate())
      {
        return;
      }
    _formKey.currentState.save();

    try
    {
      await Provider.of<Authentication>(context, listen: false).logIn(
          _authData['email'],
          _authData['password']
      );
      Navigator.of(context).pushReplacementNamed(Home.routeName);
    } catch(error)
    {
      var errorMessage = 'ການເຂົ້າສູ້ລະບົດລົ້ມເຫຼວກະລຸນາລອງໃໝ່ອີກຄັ້ງ';
      _showErrorDialog(errorMessage);
    }

  }

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
                    image: AssetImage('assets/2.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
                  )
              ),
            ),
          ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
//          key: _formKey,
              children: [
                 Flexible(
                     child: Center(
                       child: Text('CAR SHOP AUTO',style: TextStyle(color: Colors.white,fontSize: size.width * 0.1,fontWeight: FontWeight.w500),),
                     )),

                 Container(
                  //height: size.height * 0.5,
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                          // email
                            Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5.0),

                                  child: Container(
                                      height: size.height * 0.08,
                                      width: size.width * 0.8,
                                      decoration: BoxDecoration(
                                      color: Colors.grey[500].withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Center(
                                        child: TextFormField(
                                            decoration: InputDecoration(
                                            border: InputBorder.none,
                                            prefixIcon: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                              child: Icon(FontAwesomeIcons.envelope,size: 25,color: Colors.white,),
                                            ),
                                          hintText: 'Email',
                                          hintStyle: TextStyle(color: Colors.white),
                                        ),
                                          keyboardType: TextInputType.emailAddress,
                                          textInputAction: TextInputAction.next,
                                          style: TextStyle(color: Colors.white),
                                        validator: (value)
                                        {
                                          if(value.isEmpty || !value.contains('@'))
                                            {
                                              return 'invalid email';
                                            }
                                          return null;
                                        },
                                        onSaved: (value)
                                        {
                                          _authData['email'] = value;
                                        },
                                      ),
                                      ),
                                    ),
                                  ),

                          //Password
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),

                                      child: Container(
                                        height: size.height * 0.08,
                                        width: size.width * 0.8,
                                        decoration: BoxDecoration(
                                        color: Colors.grey[500].withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(16),),
                                        child: Center(
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              prefixIcon: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                                  child: Icon(FontAwesomeIcons.lock,size: 25,color: Colors.white,),
                                              ),

                                              suffixIcon: IconButton(                                               // suffixIcon แม่น่ widget ที่เปัน Icon ยู่ด้านขว่าของ password
                                                icon: Icon(Icons.remove_red_eye,),
                                                onPressed: (){
                                                  setState(() {
                                                    setPassword = !setPassword;
                                                  });
                                                },

                                              ),

                                              hintText: 'Password',
                                              hintStyle: TextStyle(color: Colors.white),
                                            ),
                                            obscureText: setPassword,
                                            style: TextStyle(color: Colors.white),
                                            validator: (value)
                                            {
                                              if(value.isEmpty || value.length<=5)
                                                {
                                                  return 'invalid password';
                                                }
                                              return null;
                                            },
                                            onSaved: (value)
                                            {
                                              _authData['password'] = value;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
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
                                    _submit();
                                },
                            ),
                          ),

                            SizedBox(
                              height: size.height * 0.05,
                            ),

                          Container(
                            child: GestureDetector(
                              onTap: (){Navigator.of(context).pushReplacementNamed(SignupScreen.routeName);},
                              child: Text('Create New Account',style: TextStyle(color: Colors.green),
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
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
