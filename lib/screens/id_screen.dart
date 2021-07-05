import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:doacao_sangue/models/user_model.dart';
import 'package:doacao_sangue/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:io';
import 'package:path/path.dart';

class IdScreen extends StatefulWidget {
  @override
  _IdScreenState createState() => _IdScreenState();
}

class _IdScreenState extends State<IdScreen> {
  File _imageFile;

  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }

  Future uploadImageToFirebase(BuildContext context) async {
    String downloadUrl;
    String fileName = basename(_imageFile.path);
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$fileName');
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    taskSnapshot.ref.getDownloadURL().then(
          (value) => downloadUrl,
        );
  }

  @override
  Widget build(BuildContext context) {
    if (UserModel.of(context).isLoggedIn()) {
      return Card(
          child: Stack(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(bottom: 8.0),
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 8.0),
              child: ScopedModelDescendant<UserModel>(
                  //para atualizar as informações quando o usuário estiver logado
                  builder: (context, child, model) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 80.0,
                                height: 80.0,
                               child: ClipRRect(
                                 borderRadius: BorderRadius.circular(45.0),
                                 child: _imageFile != null ? Image.file(_imageFile) : Image.asset("images/person.png"),
                               ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        {
                          pickImage();
                        }

                      },
                    ),
                    uploadImageButton(context),
                    Text(
                      "Nome:",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${model.userData["name"]}",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Divider(),
                    Text(
                      "Email:",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${model.userData["email"]}",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Divider(),
                    Text(
                      "Tipo Sanguíneo:",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${model.userData["bloodType"]}",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold),
                    ),
                    Divider(),
                    Text(
                      "Data de Nascimento:",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${model.userData["birthDate"]}",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Divider(),
                    Text(
                      "CPF:",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${model.userData["cpf"]}",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Divider(),
                    Text(
                      "Gênero:",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${model.userData["gender"]}",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 50.0),
                    Text(
                      "Para doar sangue é necessário apresentar documento original com foto!",
                      style: TextStyle(fontSize: 14.0, color: Colors.redAccent),
                    ),
                  ],
                );
              })),
        ],
      ));
    } else if (!UserModel.of(context).isLoggedIn()) {
      return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.person,
              size: 80.0,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              "Faça o login para consultar a carteirinha!",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16.0,
            ),
            RaisedButton(
              child: Text(
                "Entrar",
                style: TextStyle(fontSize: 18.0),
              ),
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            )
          ],
        ),
      );
    }
  }

  Widget uploadImageButton(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      child: Positioned(
        child: FloatingActionButton(
          child: Icon(
            Icons.save,
            color: Colors.white,
          ),
          onPressed: () => uploadImageToFirebase(context),
        ),
      ),
    );
  }
}
