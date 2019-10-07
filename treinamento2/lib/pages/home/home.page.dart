import 'package:flutter/material.dart';
import 'package:location/location.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                        onPressed: () {},
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
                          "ENTRAR COM O NÚMERO DE TELEFONE",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        borderSide: BorderSide(
                          color: Colors.red,
                          style: BorderStyle.solid,
                          width: 1,
                        ),
                        onPressed: () async {
                          LocationData currentLocation;
                          var location = new Location();

                          try {
                            currentLocation = await location.getLocation();
                            print(
                              "Latitude: " +
                                  currentLocation.latitude.toString(),
                            );
                            print(
                              "Longitude: " +
                                  currentLocation.longitude.toString(),
                            );
                          } on Exception catch (e) {
                            print(e);
                            currentLocation = null;
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
