/*import "dart:async";
import "dart:convert";
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MeApp());

class MeApp extends StatelessWidget {
  const MeApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Image',
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  List data;
  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://webapipersonasm.azurewebsites.net/api/people"),
        headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      print(data[1]["Name"]);
      //return data.map((people) => new People.fromJson(people)).toList();
    }
    /*else {
      throw Exception('Fallo al llamar a la Api');
    }*/
    return "Satisfactorio";
  }

  _InicioState() {
    this.getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi App con Imagen"),
      ),
      body: new ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              child: new Text(data[index]["Name"]));
          }),
      /*ListView(
        children: <Widget>[
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.network(
              "https://www.ecestaticos.com/image/clipping/79776773aab795837282c7d4947abaf7/por-que-nos-parece-que-los-perros-sonrien-una-historia-de-30-000-anos.jpg"),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Image.network("https://perro.shop/wp-content/uploads/pug.jpg"),
        ),
        new Center(
            child: new RaisedButton(
                child: new Text("Obtener dato"), 
                onPressed: getData)
                ),
      ]*/
    );
  }
}*/
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(home: new HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://webapipersonasm.azurewebsites.net/api/people"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      data = json.decode(response.body);
    });

    print(data[0]["Name"]);

    return "Success!";
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Listviews"), backgroundColor: Colors.blue),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Text(data[index]["Name"]),
          );
        },
      ),
    );
  }
}
