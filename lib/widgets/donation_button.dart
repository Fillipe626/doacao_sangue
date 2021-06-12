import 'package:doacao_sangue/screens/donation_list.dart';
import 'package:flutter/material.dart';

class DonationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.plus_one, color: Colors.white,),
      onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DonationList()));
      },
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
