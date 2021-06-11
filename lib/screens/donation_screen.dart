import 'package:brasil_fields/brasil_fields.dart';
import 'package:doacao_sangue/datas/donation_data.dart';
import 'package:doacao_sangue/models/donation_model.dart';
import 'package:doacao_sangue/models/user_model.dart';
import 'package:doacao_sangue/screens/home_screen.dart';
import 'package:doacao_sangue/screens/login_screen.dart';
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
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    DataInputFormatter(),
                  ],
                  controller: _dateController,
                  decoration: InputDecoration(hintText: "Data da doação"),
                  validator: (text) {
                    if (text.isEmpty) return "Informe a data da sua doação!";
                  },
                ),
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
                        if (UserModel.of(context).isLoggedIn()) {
                          DonationData donationData = DonationData();
                          donationData.data = _dateController.text;

                          DonationModel.of(context).addDonation(donationData);
                        } else {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                        }
                        _onSuccess();
                      }
                      ),
                ),
              ],
            ),
          );
        }
      )
    );
  }

  void _onSuccess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Doação registrada com sucesso!"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 3),
    ));
    Future.delayed(Duration(seconds: 2)).then((_) {
      //Depois de registrada a doação aguardamos deois segundos e levamos até a tela de doações
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

}
