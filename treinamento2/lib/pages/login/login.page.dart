import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:treinamento2/pages/animations/images.dart';
import 'package:treinamento2/pages/login/facebook.login.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: Background(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Logo(),
              flex: 3,
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      width: double.infinity,
                      child: OutlineButton(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        shape: StadiumBorder(),
                        textColor: Colors.white,
                        child: Text(
                          //TODO adicionar nome recuperado do FB
                          "Continuar como ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        borderSide: BorderSide(
                          color: Colors.red,
                          style: BorderStyle.solid,
                          width: 1,
                        ),
                        //TODO ir pra tela principal
                        onPressed: () async {},
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      width: double.infinity,
                      child: OutlineButton(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        shape: StadiumBorder(),
                        textColor: Colors.white,
                        child: Text(
                          "LOGOFF",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        borderSide: BorderSide(
                          color: Colors.red,
                          style: BorderStyle.solid,
                          width: 1,
                        ),
                        onPressed: () async {
                          try {
                            LoginFB.logOut();
                          } catch (e) {
                            print(e.toString());
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
