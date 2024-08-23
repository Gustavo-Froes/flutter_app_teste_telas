import 'package:flutter/material.dart';

class Tela2 extends StatefulWidget {
  const Tela2({Key? key}) : super(key: key);

  @override
  _Tela2State createState() => _Tela2State();
}

class _Tela2State extends State<Tela2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela 2"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => {Navigator.pushNamed(context, '/tela3')},
          child: Text("Tela 3"),
        ),
      ),
    );
  }
}
