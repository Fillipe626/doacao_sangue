
import 'package:cloud_firestore/cloud_firestore.dart';

class UserData{

  String id;

  String name;

  String cpf;

  String email;

  String birthDate;

  String bloodType;

  UserData userData;

  UserData();

  UserData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    name = snapshot.data['name'];
    cpf = snapshot.data['cpf'];
    email = snapshot.data['email'];
    birthDate = snapshot.data['birthDate'];
    bloodType = snapshot.data['bloodType'];
  }

}