import 'package:doacao_sangue/models/user_model.dart';
import 'package:doacao_sangue/screens/home_screen.dart';
import 'package:doacao_sangue/screens/information_screen.dart';
import 'package:doacao_sangue/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {


  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();//Chave global para acesso do scafold na função onSuccess
  final _formKey = GlobalKey<FormState>(); //Chave global para acesso do formulário

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Entrar'),
          centerTitle: true,
          actions: <Widget>[
            FlatButton(
                child: Text('CRIAR CONTA',
                  style: TextStyle(
                      fontSize: 15.0
                  ),
                ),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => SignUpScreen())
                  );
                }
            ),
          ],
        ),
        body: ScopedModelDescendant<
            UserModel>( // Reconstroi a tela como se fosse um setState
          builder: (context, child, model) {
            if (model.isLoading)
              return Center(child: CircularProgressIndicator(),);
            return Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.all(16.0),
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: "E-mail"
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (text) {
                        if (text.isEmpty || !text.contains("@") ||
                            !text.contains("."))
                          return "Digite um e-mail válido!";
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _passController,
                      decoration: InputDecoration(
                          hintText: "Senha"
                      ),
                      obscureText: true,
                      validator: (text) {
                        if (text.isEmpty || text.length < 7)
                          return "O campo senha não pode estar vazio ou ter menos de 7 \ncaracteres!";
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () {
                          if(_emailController.text.isEmpty)
                            _scaffoldKey.currentState.showSnackBar(
                              SnackBar(content: Text("Insira seu e-mail para continuar!"),
                                backgroundColor: Colors.redAccent,
                                duration: Duration(seconds: 5),
                              )
                            );
                            else {
                            model.recoverPass(_emailController.text);
                            _scaffoldKey.currentState.showSnackBar(
                                SnackBar(content: Text(
                                    "Um e-mail foi enviado com instruções para redefinir a sua senha."),
                                  backgroundColor: Theme
                                      .of(context)
                                      .primaryColor,
                                  duration: Duration(seconds: 5),

                                )
                            );
                          }
                        },
                        child: Text("Esqueci minha senha",
                          textAlign: TextAlign.right,
                        ),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    SizedBox(
                      height: 44.0,
                      child: RaisedButton(
                        child: Text("Entrar",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        textColor: Colors.white,
                        color: Theme
                            .of(context)
                            .primaryColor,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {

                          }
                          model.signIn(email: _emailController.text,
                              pass: _passController.text,
                              onSuccess: _onSuccess,
                              onFail: _onFail
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) =>
                                  InformationScreen())
                          );
                        },
                        child: Text("Consultar informações >",
                          textAlign: TextAlign.center,
                        ),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                )
            );
          },
        )
    );
  }

  void _onSuccess(){
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context)=>HomeScreen())
    );
  }

  void _onFail(){

        _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Falha ao fazer login. Verifique seu e-mail e senha!"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 5),

        )
    );
      

  }


}


