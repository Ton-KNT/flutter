import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http ;
import 'dart:convert';
import 'http_exception.dart';

class Authentication with ChangeNotifier
{

  Future<void> signUp(String email, String password,) async
  {
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyABoGO0eZOIPitRBCa2hAror7cXX3XhSeU';

    try
    {
      final response = await http.post(url, body: json.encode(
          {
            'email' : email,
            'password' : password,
            'returnSecureToken' : true,
          }
      ));
      final responseData = json.decode(response.body);

//      print(responseData);

      if(responseData['error'] != null)
      {
        throw HttpException(responseData['email']['message']);
      }
    } catch(error)
    {
      throw error;
    }
  }

  ////////////////////////////////////////______///////////////////////////////

  Future<void> logIn(String email, String password) async
  {
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyABoGO0eZOIPitRBCa2hAror7cXX3XhSeU';

    try{
      final response = await http.post(url, body: json.encode(
          {
            'email' : email,
            'password' : password,
            'returnSecureToken' : true,
          }
      ));
      final responseData = json.decode(response.body);

      //print(responseData);

      if(responseData['error'] != null)
        {
          throw HttpException(responseData['email']['message']);
        }
    } catch(error)
    {
      throw error;
    }

//    final response = await http.post(url, body: json.encode(
//        {
//          'email' : email,
//          'password' : password,
//          'returnSecureToken' : true,
//        }
//    ));
//    final responseData = json.decode(response.body);
//    print(responseData);
  }
}