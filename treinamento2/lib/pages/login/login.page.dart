import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/img/back.jpg",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Image.asset(
                  "assets/img/logo.png",
                  width: 100,
                  height: 100,
                ),
              ),
              flex: 3,
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    TextField(
                      onChanged: (value) {
                        login = value;
                      },
                      style: TextStyle(fontSize: 15),
                      decoration: new InputDecoration(
                        filled: true,
                        hintText: 'E-Mail',
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    TextField(
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

                            print('user');
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
