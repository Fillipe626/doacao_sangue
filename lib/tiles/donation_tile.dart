import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DonationTile extends StatelessWidget {

  final DocumentSnapshot snapshot;

  DonationTile(this.snapshot);

  @override
  Widget build(BuildContext context) {

    return ListTile(
      contentPadding: EdgeInsets.all(15.0),
      leading: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.redAccent,

      ),
      title: Text(snapshot.data["data"]),
      trailing: Icon(Icons.favorite_rounded, color: Colors.redAccent,),
      onTap: (){},
    );
  }
}
