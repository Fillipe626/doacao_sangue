import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class CartTile extends StatelessWidget {

  final DocumentSnapshot snapshot;

  CartTile(this.snapshot);


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.redAccent,

      ),
      title: Text(snapshot.data["doacao"]),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: (){},
    );
  }
}

