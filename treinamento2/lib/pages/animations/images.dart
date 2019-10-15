//Background
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart' as prefix0;

class Background extends prefix0.BoxDecoration {
  final prefix0.BoxDecoration bg;
  Background({this.bg})
      : super(
          image: DecorationImage(
            image: AssetImage(
              "assets/img/back.jpg",
            ),
            fit: BoxFit.fill,
          ),
        );
}

//Logotipo
/* class Logo extends prefix0.BoxDecoration {
  final prefix0.BoxDecoration logo;
  Logo({this.logo})
      : super(
          image: DecorationImage(
            image: AssetImage("assets/img/logo.png"),
            fit: BoxFit.contain,
          ),
        );
} */

class Logo extends Container {
  final Container logo;
  Logo({this.logo})
      : super(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/logo.png"),
              fit: BoxFit.contain,
            ),
          ),
          width: 100,
          height: 100,
        );
}
