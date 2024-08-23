import 'dart:convert';
import 'package:flutter_application_1/model/db/Banco.dart';
import 'package:http/http.dart' as http;

class User {
  String username;
  String password;
  String ultimoLogin;

  User(this.username, this.password, this.ultimoLogin);

  Future<Map<String, dynamic>> autentica() async {
    final resposta = await http.post(
        Uri.parse('https://tarrafa.unimontes.br/aula/autentica'),
        headers: {'Content-Type': 'application/json'},
        body: json
            .encode({'username': this.username, 'password': this.password}));

    return json.decode(resposta.body) as Map<String, dynamic>;
  }

  Future<int> insereUsuario() async {
    final db = await Banco.instance.database;
    return db.rawInsert("""
    INSERT OR REPLACE INTO user(username,password, ultimoLogin)
    VALUES('${this.username}'),'${this.password}'),'${this.ultimoLogin}')
    """);
  }

  static Future<User?> verificaUsuario() async {
    final db = await Banco.instance.database;
    List<Map<String, Object?>> lista = await db.rawQuery('SELECT * FROM user');

    if (lista.isNotEmpty) {
      Map<String, Object?> utemp = lista.first;
      User user = User(utemp['usarname'].toString(),
          utemp['password'].toString(), utemp['ultimo_Login'].toString());
      return user;
    }
    return null;
  }

  Future<int> removeUsuario() async {
    final db = await Banco.instance.database;
    return db.rawDelete("""
        DELETE FROM user where username = '${this.username}'
     """);
  }
}
