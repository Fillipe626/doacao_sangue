import 'package:brasil_fields/brasil_fields.dart';
import 'package:doacao_sangue/datas/donation_data.dart';
import 'package:doacao_sangue/models/donation_model.dart';
import 'package:doacao_sangue/models/user_model.dart';
import 'package:doacao_sangue/screens/donation_list.dart';
import 'package:doacao_sangue/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';

class DonationScreen extends StatefulWidget {
  @override
  _DonationScreenState createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  final _dateController = TextEditingController();

  final _scaffoldKey = GlobalKey<
      ScaffoldState>(); //Chave global para acesso do scafold nas funções on success e on fail
  final _formKey =
      GlobalKey<FormState>(); //Chave global para acesso do formulário
  @override
  Widget build(BuildContext context) {

    return Scaffold(

        key: _scaffoldKey,
        body: ScopedModelDescendant<DonationModel>(
            builder: (context, child, model) {

          return Form(

            key: _formKey,
            child: ListView(

              padding: EdgeInsets.only(top: 120.0, left: 20.0, right: 20.0),
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ TextFormField(
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      DataInputFormatter(),
                    ],
                    controller: _dateController,
                    decoration: InputDecoration(hintText: "Digite a data da doação"),
                    validator: (text) {
                      if (text.isEmpty) return "Informe a data da sua doação!";
                    },
                  ),
                    SizedBox(height: 70.0,),
                    SizedBox(
                      height: 44.0,
                      child: RaisedButton(
                          child: Text(
                            "Registrar doação",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          textColor: Colors.white,
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            if (UserModel.of(context).isLoggedIn() & _formKey.currentState.validate()) {
                              DonationData donationData = DonationData();


                              donationData.data = _dateController.text;

                              DonationModel.of(context).addDonation(donationData);
                              _onSuccess();
                            } else {
                              _onFail();
                            }

                          }),
                    ),

                  ],
                )

              ],
            ),
          );
        }));
  }

  void _onSuccess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Doação registrada com sucesso!"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 3),
    ));
    /*Future.delayed(Duration(seconds: 2)).then((_) {
      //Depois de registrada a doação aguardamos deois segundos e levamos até a tela de doações
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => DonationList()));
    });*/
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("O campo não pode estar em branco e o usuário precisa estar logado!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 3),
    ));

  }
}
