import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/root.dart';
import 'package:flutter_application_1/view/tela1.dart';
import 'package:flutter_application_1/view/tela2.dart';
import 'package:flutter_application_1/view/tela3.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App de teste",
      initialRoute: '/',
      routes: {
        '/': (context) => const Root(),
        '/tela1': (context) => const Tela1(),
        '/tela2': (context) => const Tela2(),
        '/tela3': (context) => const Tela3()
      },
    );
  }
}
