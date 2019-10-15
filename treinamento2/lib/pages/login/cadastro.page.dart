import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:treinamento2/pages/animations/images.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  @override
  Widget build(BuildContext context) {
    String login;
    String senha;

    final FirebaseAuth _auth = FirebaseAuth.instance;
    Future<FirebaseUser> _handleLogin() async {
      final AuthResult auth = await _auth.signInWithEmailAndPassword(
        email: 'ffumagalli23@gmail.com',
        password: '123456',
      );

      return auth.user;
    }

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
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          login = value;
                        },
                        style: TextStyle(fontSize: 15),
                        decoration: new InputDecoration(
                          filled: true,
                          hintText: 'E-mail',
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) {
                          senha = value;
                        },
                        obscureText: true,
                        style: TextStyle(fontSize: 15),
                        decoration: new InputDecoration(
                          filled: true,
                          hintText: 'Senha',
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(20),
                            ),
                          ),
                        ),
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
                          "LOGIN",
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
                            var user = await _handleLogin();
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
