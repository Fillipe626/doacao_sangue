import 'package:cloud_firestore/cloud_firestore.dart';

class DonationData{

  String cid;
  String data;

  DonationData donationData;

  DonationData.fromDocument(DocumentSnapshot document){
    cid = document.documentID;
    data = document.data["data"];
  }

  Map<String, dynamic>toMap(){
    return {
      "cid": cid,
      "data": data
    };
  }

}