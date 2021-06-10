import 'package:doacao_sangue/screens/home_screen.dart';
import 'package:doacao_sangue/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'models/donation_model.dart';
import 'models/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
        model: UserModel(),//Para evitar o setState por todo o app
        child: ScopedModelDescendant<UserModel>(
          builder: (context, child, model){
            return ScopedModel<DonationModel>(
              model: DonationModel(model),
              child: MaterialApp(
                title: 'Doação de Sangue',
                theme: ThemeData(
                    primarySwatch: Colors.blue,
                    primaryColor: Color.fromARGB(255, 4, 125, 200)

                ),
                debugShowCheckedModeBanner: false,
                home: HomeScreen(),
              ),
            );
          },
    )

    );

  }
}

