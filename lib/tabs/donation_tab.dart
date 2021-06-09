import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doacao_sangue/tiles/donation_tile.dart';
import 'package:flutter/material.dart';

class DonationTab extends StatefulWidget {
  @override
  _DonationTabState createState() => _DonationTabState();
}

class _DonationTabState extends State<DonationTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("doacoes").getDocuments(),
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
  }
}
