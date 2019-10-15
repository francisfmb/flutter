import 'package:flutter/material.dart';
import 'package:treinamento2/pages/animations/animations.dart';
import 'package:treinamento2/pages/animations/images.dart';
import 'package:treinamento2/pages/login/cadastro.page.dart';
import 'package:treinamento2/pages/login/facebook.login.dart';
import 'package:treinamento2/pages/login/login.page.dart';
//import 'pages/login/login.page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      width: double.infinity,
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Text(
                          "FAZER LOGIN COM FACEBOOK",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        color: Colors.blue,
                        onPressed: () async {
                          //Criar NOVO usuario
                          try {
                            Map profileFB = await LoginFB.login();
                            if (profileFB.isNotEmpty) {
                              print('logado');
                              Navigator.push(
                                context,
                                FadeRoute(
                                  page: LoginPage(),
                                ),
                              );
                            } else {
                              print('NÃO logado');
                            }
                          } catch (e) {
                            print(e.toString());
                          }
                        },
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
                          "LOGIN COM E-MAIL",
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
                            //_handleCreateUser(email,pass);
                            Navigator.push(
                              context,
                              FadeRoute(
                                page: CadastroPage(),
                              ),
                            );
                          } catch (e) {
                            print(e.toString());
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              flex: 2,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "Ao continuar, você concorda com nossos \n",
                      ),
                      TextSpan(
                        text: "Termos de serviço",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                      TextSpan(
                        text: " e ",
                      ),
                      TextSpan(
                        text: "Política de privacidade",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
