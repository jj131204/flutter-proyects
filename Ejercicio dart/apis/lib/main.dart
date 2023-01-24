import 'dart:convert';
import 'package:apis/models/Gif.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Gif>> _listadoGif;

  void getGifs() async {
    var url =
        'https://api.giphy.com/v1/gifs/trending?api_key=NnjLBENwniKWGguULo4J2dDChG1UIWVz&limit=10&rating=g';
    final response = await http.get(Uri.parse(url));

    List<Gif> gifs = [];

    // print(response.body);
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);

      // print(jsonData["data"][0]["type"]);

      for (var item in jsonData["data"]) {
        gifs.add(Gif(item["title"], item["images"]["downsized"]["url"]));
      }
    } else {
      throw Exception(response.body);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    // Funcion que se ejecuta apenas se cargue la pantalla
    super.initState();
    getGifs();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
