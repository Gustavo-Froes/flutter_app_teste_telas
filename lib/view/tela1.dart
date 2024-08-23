import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/model/user.dart';

class Tela1 extends StatefulWidget {
  const Tela1({Key? key}) : super(key: key);

  @override
  _Tela1State createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => {Navigator.pushNamed(context, '/tela2')},
            child: Text('Tela 2'),
          ),
          ElevatedButton(
            onPressed: () {
              User.verificaUsuario().then((user) {
                if(user != null) {
                  user.removeUsuario().then((value) {
                    if(value > 0) {
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                  }
              });
            }
          });
        },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
