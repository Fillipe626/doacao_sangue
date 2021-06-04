import 'package:brasil_fields/brasil_fields.dart';
import 'package:doacao_sangue/models/user_model.dart';
import 'package:doacao_sangue/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';

import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  int _bloodType;

  var bloodType = <String>[
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-',
    'Não sei'
  ];

  String _bloodController;
  final _nameController = TextEditingController();
  final _cpfController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _scaffoldKey = GlobalKey<
      ScaffoldState>(); //Chave global para acesso do scafold nas funções on success e on fail
  final _formKey =
      GlobalKey<FormState>(); //Chave global para acesso do formulário
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Criar conta'),
          centerTitle: true,
        ),
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            if (model.isLoading)
              return Center(
                child: CircularProgressIndicator(),
              );
            return Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(hintText: "Nome Completo"),
                    validator: (text) {
                      if (text.isEmpty) return "Digite o seu nome";
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter(),
                    ],
                    controller: _cpfController,
                    decoration: InputDecoration(hintText: "CPF"),
                    validator: (text) {
                      if (text.isEmpty) return "Digite o seu CPF";
                    },
                  ),
                  SizedBox(height: 16.0),
                  new DropdownButton<String>( // Ficou feio mas funciona
                    hint: new Text('Escolha seu tipo sanguíneo'),
                    value: _bloodType == null ? null : bloodType[_bloodType],
                    items: bloodType.map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _bloodType = bloodType.indexOf(value);
                        switch (_bloodType){
                          case 0:
                            _bloodController = "A+";
                            break;
                          case 1:
                            _bloodController = "A-";
                            break;
                          case 2:
                            _bloodController = "B+";
                            break;
                          case 3:
                            _bloodController = "B-";
                            break;
                          case 4:
                            _bloodController = "O+";
                            break;
                          case 5:
                            _bloodController = "O-";
                            break;
                          case 6:
                            _bloodController = "AB+";
                            break;
                          case 7:
                            _bloodController = "AB-";
                            break;
                          case 8:
                            _bloodController = "Não sei";
                            break;

                        }
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      DataInputFormatter(),
                    ],
                    controller: _birthDateController,
                    decoration: InputDecoration(hintText: "Data de Nascimento"),
                    validator: (text) {
                      if (text.isEmpty) return "A sua data de nascimento!";
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(hintText: "E-mail"),
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text.isEmpty ||
                          !text.contains("@") ||
                          !text.contains("."))
                        return "Digite um e-mail válido!";
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _passController,
                    decoration: InputDecoration(hintText: "Senha"),
                    obscureText: true,
                    validator: (text) {
                      if (text.isEmpty || text.length < 7)
                        return "O campo senha não pode estar vazio ou ter menos de 7 \ncaracteres!";
                    },
                  ),
                  SizedBox(height: 16.0),
                  SizedBox(
                    height: 44.0,
                    child: RaisedButton(
                      child: Text(
                        "Criar conta",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Map<String, dynamic> userData = {
                            "name": _nameController.text,
                            "cpf": _cpfController.text,
                            "bloodType": _bloodController,
                            "birthDate": _birthDateController.text,
                            "email": _emailController.text,
                          };

                          model.signUp(
                              userData: userData,
                              pass: _passController.text,
                              onSuccess: _onSuccess,
                              onFail: _onFail);
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }

  void _onSuccess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Usuário criado com sucesso!"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 3),
    ));
    Future.delayed(Duration(seconds: 2)).then((_) {
      //Depois do usuário criado, aguardamos dois segundos e damos um pop na tela para retornar
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
          "Falha ao criar usuário. Caso o email já esteja cadastrado, utilize o botão esqueci a minha senha!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 5),
    ));
  }
}
