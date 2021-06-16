import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doacao_sangue/models/user_model.dart';
import 'package:doacao_sangue/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:doacao_sangue/tiles/donation_tile.dart';


class DonationList extends StatefulWidget {
  @override
  _DonationListState createState() => _DonationListState();
}

class _DonationListState extends State<DonationList> {
  @override
  Widget build(BuildContext context) {
    if (UserModel.of(context).isLoggedIn()) {
      return FutureBuilder<QuerySnapshot>(
          future: Firestore.instance.collection("donation").getDocuments(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );
            else {
              var dividedTiles = ListTile.divideTiles(
                  tiles: snapshot.data.documents.map((doc) {
                    return DonationTile(doc);
                  }).toList(),
                  color: Colors.grey[500])
                  .toList();

              return ListView(
                children: dividedTiles,
              );
            }
          }
      );
    } else if (!UserModel.of(context).isLoggedIn()) {
      return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.favorite_rounded,
              size: 80.0, color: Theme
                  .of(context)
                  .primaryColor,),
            SizedBox(height: 16.0,),
            Text("Faça o login para consultar doações!",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0,),
            RaisedButton(
              child: Text("Entrar", style: TextStyle(fontSize: 18.0),),
              textColor: Colors.white,
              color: Theme
                  .of(context)
                  .primaryColor,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen())
                );
              },
            )
          ],
        ),
      );
    }
  }
}

