import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

//Tela Um
class _HomePageState extends State<HomePage> {
  TextEditingController txtCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Um"),
        actions: <Widget>[Icon(Icons.account_box)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mostraAlerta();
        },
        child: Icon(Icons.announcement),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //caixa de texto
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(
              controller: txtCtrl,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),

          //botão
          Center(
            child: RaisedButton(
              child: Text("Mudar a tela"),
              onPressed: () {
                irTelaDois(context, txtCtrl.text);
              },
            ),
          ),
        ],
      ),
    );
  }

  void irTelaDois(BuildContext context, String texto) async {
    // String texto = txtCtrl.text;

    final volta = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaDois(text: texto),
      ),
    );

    setState(() {
      txtCtrl.text = volta;
    });
  }

  void mostraAlerta() {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alerta = AlertDialog(
      title: Text("Titulo"),
      content: Text("Conteudo"),
      actions: <Widget>[okButton],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}

class TelaDois extends StatefulWidget {
  final String text;

  TelaDois({Key key, @required this.text}) : super(key: key);

  @override
  _TelaDoisState createState() => _TelaDoisState();
}

//Tela Dois
class _TelaDoisState extends State<TelaDois> {
  TextEditingController txtCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.text),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //texto
          Center(
            child: TextField(
              controller: txtCtrl,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),

          //botão
          Center(
            child: RaisedButton(
              child: Text("Mudar a tela"),
              onPressed: () {
                irTelaUm(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  void irTelaUm(BuildContext context) {
    String txtvolta = txtCtrl.text;
    Navigator.pop(context, txtvolta);
  }
}
