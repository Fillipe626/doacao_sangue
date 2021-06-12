import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doacao_sangue/datas/donation_data.dart';
import 'package:doacao_sangue/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class DonationModel extends Model{

  UserModel user;

  List<DonationData> donation = [];

  DonationModel(this.user);

  static DonationModel of (BuildContext context) => ScopedModel.of<DonationModel>(context);


  void addDonation(DonationData donationData){
    donation.add(donationData);

    Firestore.instance.collection("donation").add(donationData.toMap()).then((doc){
      donationData.cid = doc.documentID;
    });
    
    notifyListeners();
  }

  void removeDonation(DonationData donationData){
    Firestore.instance.collection("users").document(user.firebaseUser.uid).collection("donation").document(donationData.cid).delete();

    donation.remove(donationData);

    notifyListeners();
  }

}