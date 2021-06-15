import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doacao_sangue/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class IdScreen extends StatefulWidget {
  @override
  _IdScreenState createState() => _IdScreenState();
}

class _IdScreenState extends State<IdScreen> {
  @override
  Widget build(BuildContext context) {


    return Card(
        child: Stack(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 8.0),
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: ScopedModelDescendant<UserModel>(
                //para atualizar as informações quando o usuário estiver logado
                builder: (context, child, model) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 80.0,
                              height: 80.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage("images/person.png"),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Nome:",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${model.userData["name"]}",
                    style:
                    TextStyle(fontSize: 18.0),
                  ),
                  Divider(),
                  Text("Email:",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${model.userData["email"]}",
                    style:
                    TextStyle(fontSize: 18.0),
                  ),
                  Divider(),
                  Text(
                    "Tipo Sanguíneo:",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${model.userData["bloodType"]}",
                    style:
                    TextStyle(fontSize: 18.0, color: Colors.redAccent, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  Text(
                    "Data de Nascimento:",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${model.userData["birthDate"]}",
                    style:
                    TextStyle(fontSize: 18.0),
                  ),
                  Divider(),
                  Text(
                    "CPF:",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${model.userData["cpf"]}",
                    style:
                    TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 120.0),
                  Text(
                    "Para doar sangue é necessário apresentar documento original com foto!",
                    style:
                    TextStyle(fontSize: 14.0, color: Colors.redAccent),
                  ),
                ],
              );
            })

        ),
      ],
    ));

  }
}
