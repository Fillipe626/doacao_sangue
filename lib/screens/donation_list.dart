import 'package:doacao_sangue/models/donation_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


class DonationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas doações"),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 8.0),
            alignment: Alignment.center,
            child: ScopedModelDescendant<DonationModel>(
              builder: (context, child, model){
                int p = model.donation.length;
                return Text (
                  "${p ?? 0} ${p == 1 ? "Doação" : "Doações"}",
                  style: TextStyle(fontSize: 17.0),
                );
              },
            ),
          )
        ],
      ),
      body: ScopedModelDescendant<DonationModel>(

      ),
    );
  }
}
