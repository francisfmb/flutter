import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_world/Models/Item.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
  var items = new List<Item>();

  HomePage() {
    items = [];
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var newTaskCtrl = TextEditingController();

  void adicionarItem() {
    if (newTaskCtrl.text.isEmpty) {
      return;
    }

    setState(() {
      widget.items.add(
        Item(
          titulo: newTaskCtrl.text,
          feito: false,
        ),
      );
      newTaskCtrl.clear();
      save();
    });
  }

  void removerItem(int index) {
    setState(() {
      widget.items.removeAt(index);
      save();
    });
  }

  Future load() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('data');

    if (data != null) {
      Iterable decode = jsonDecode(data);
      List<Item> resultado = decode.map((x) => Item.fromJson(x)).toList();
      setState(() {
        widget.items = resultado;
      });
    }
  }

  save() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', jsonEncode(widget.items));
  }

  _HomePageState() {
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: newTaskCtrl,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            labelText: "Nova tarefa",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext ctxt, int index) {
          final item = widget.items[index];
          return Dismissible(
            onDismissed: (direction) {
              Scaffold.of(ctxt).showSnackBar(
                SnackBar(
                  content: Text(widget.items[index].titulo + " Excluido"),
                ),
              );
              removerItem(index);
            },
            child: CheckboxListTile(
              title: Text(item.titulo),
              value: item.feito,
              onChanged: (value) {
                setState(() {
                  item.feito = value;
                  save();
                });
              },
            ),
            key: Key(item.titulo),
            background: Container(
              color: Colors.red.withOpacity(0.5),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          adicionarItem();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
