import 'package:doacao_sangue/models/user_model.dart';
import 'package:doacao_sangue/screens/login_screen.dart';
import 'package:doacao_sangue/tiles/drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer(this.pageController);//Criado um construtor para receber o controlador de pagina

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          //degrade
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color.fromARGB(100, 192, 245, 210), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
        );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 40.0,
                      left: 0.0,
                      child: Text("Doe Sangue!",
                          style: TextStyle(
                              fontSize: 34.0, fontWeight: FontWeight.bold)),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: ScopedModelDescendant<UserModel>(//para atualizar as informações quando o usuário estiver logado
                        builder: (context, child, model){
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                          "Olá, ${!model.isLoggedIn() ? "" : model.userData["name"] == null ? "" : model.userData["name"]}",
                                style: TextStyle(
                                    fontSize: 18.0, fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                child: Text(
                                  !model.isLoggedIn() ?
                                  "Entre ou cadastre-se >" : "Sair",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {
                                  if (!model.isLoggedIn())
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context)=>LoginScreen())
                                  ); else model.signOut();

                                },
                              )
                            ],
                          );
                        }
                      )
                    ),
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, "Inicio", pageController,0),
              DrawerTile(Icons.contacts, "Carteirinha Digital", pageController,1),
              DrawerTile(Icons.playlist_add, "Doações", pageController,2),
              DrawerTile(Icons.notifications_active, "Notificações", pageController,3),
              DrawerTile(Icons.info_outline, "Informações", pageController,4),

            ],
          )
        ],
      ),
    );
  }
}
