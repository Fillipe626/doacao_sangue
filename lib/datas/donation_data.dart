import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DonationData{

  String cid;
  String data;
  DonationData donationData;

  DonationData.fromDocument(DocumentSnapshot document){
    cid = document.documentID;
    data = document.data["data"];
  }

  DonationData();

  Map<String, dynamic>toMap(){
    return {
      "cid": cid,
      "data": data
    };
  }

}