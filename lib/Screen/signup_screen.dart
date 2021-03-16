import 'dart:ui';
import 'package:dbtestproject3it1/Screen/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class SignupScreen extends StatefulWidget {
  static const routeName = 'sign_up';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {



  File _image;
  final picker = ImagePicker();

  Future getImage() async{
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if(pickedFile != null){
        _image = File(pickedFile.path);
      }
    });
  }

  bool setPassword = true;
  final GlobalKey<FormState> _formKey =  GlobalKey();
  TextEditingController _passwordController = new TextEditingController();

  Map<String, String> _authData = {
    'email' : '',
    'password' : ''
  };



  void _showErrorDialog(String msg)
  {
    showDialog(context: context,
        builder: (context) => AlertDialog(
          title: Text('ເກີດຂໍ້ຜິດພາດ'),
          content: Text(msg),
          actions: [
            MaterialButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text('ຕົກລົງ'),
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
      await Provider.of<Authentication>(context, listen: false).signUp(
          _authData['email'],
          _authData['password']
      );
      //Navigator.of(context).pushReplacementNamed(Home.routeName);
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    } catch(error)
    {
      var errorMessage = 'ການລົງທະບຽນເຂົ້າສູ້ລະບົດລົ້ມເຫຼວກະລຸນາລອງໃໝ່ອີກຄັ້ງ';
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
              body: SingleChildScrollView(
                child: Column(
                  //key: _formKey,
                  children: [

                    SizedBox(height: size.height * 0.1,),

                    Stack(
                      children:[
                       Center(
                        child: ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 3,sigmaY: 3),
                            child: CircleAvatar(
                              radius: size.width * 0.14,
                              backgroundColor: Colors.grey[400].withOpacity(0.4),

                              child: Center(
                                child: _image == null
                                ? Icon(FontAwesomeIcons.user,color: Colors.white,size: size.width * 0.1,)
                                : Image.file(_image,),

                              ),
                            ),
                          ),
                        ),
                      ),
                        Positioned(
                          top: size.height * 0.08,
                          left: size.width * 0.56,

                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              onPressed: () { getImage(); },
                              child: Icon(
                                FontAwesomeIcons.arrowUp,
                                color: Colors.white,
                              ),
                            ),
                          //),
                        ),
                      ],
                    ),

                    SizedBox(height: size.height * 0.1,),

                     Container(
                      //height: size.height * 0.5,                                      // ถ้า height: size.height * 0.5 แม่นหมายเถิงความสูงแม่นเท่าเคิ่งหนึ่งของหน้าจ่     แต่ถ้า height: size.height * 1.0 แม่นหมายเถิงความสูงแม่นจะเตัมหน้าจ่
                      width: double.infinity,                                         // width: double.infinity  แม่นหมายเถิงความก้วางจำขอบหน้าจ่อ
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
                                        style: TextStyle(color: Colors.white),
                                        keyboardType: TextInputType.emailAddress,
                                        textInputAction: TextInputAction.next,
                                        validator: (value)
                                        {
                                          if(value.isEmpty || !value.contains('@')) // ความหมายคื ถ้า value นั้น ว่าง หลื value บ่มี @ ก่จะคืนคำว่า invalid email
                                          {
                                            return 'invalid email';
                                          }
                                          return null;
                                        },
                                        onSaved: (value)
                                        {
                                          _authData['email'] = value;
                                          return value;
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
                                      borderRadius: BorderRadius.circular(16),
                                    ),
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
                                        controller: _passwordController,
                                        style: TextStyle(color: Colors.white),
                                        validator: (value)
                                        {
                                          if(value.isEmpty || value.length<=5) // ถ้า value นั้นว่าง หลื มีจำนวนหน้อยก่วา หลื เท่ากับ 5 ก่จะคืนคำว่า invalid password
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


                                //Confirm password
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

                                            border: InputBorder.none,
                                            hintText: 'Confirm password',
                                            hintStyle: TextStyle(color: Colors.white),
                                        ),
                                        obscureText: setPassword,
                                        style: TextStyle(color: Colors.white),
                                        validator: (value)
                                        {
                                          if(value.isEmpty || value != _passwordController.text)
                                          {
                                            return 'invalid password';
                                          }
                                          return null;
                                        },
                                        onSaved: (value)
                                        {

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
                                    child: Text('Register',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                                    onPressed: (){
                                      _submit();
                                    },
                                  ),
                                ),

                                SizedBox(
                                  height: size.height * 0.05,
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Already have an account? ',style: TextStyle(color: Colors.white),),
                                    Container(
                                      child: GestureDetector(
                                          onTap: () => Navigator.of(context).pushReplacementNamed(LoginScreen.routeName),// go to register page
                                          child: Text('Login',style: TextStyle(color: Colors.green),)
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
                                )
                              ],
                            ),
                          ),
                        ),
                     ),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}
