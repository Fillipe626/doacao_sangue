import 'package:doacao_sangue/screens/donation_screen.dart';
import 'package:doacao_sangue/screens/id_screen.dart';
import 'package:doacao_sangue/screens/information_screen.dart';
import 'package:doacao_sangue/screens/donation_list.dart';
import 'package:doacao_sangue/tabs/home_tab.dart';
import 'package:doacao_sangue/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {


    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Carteirinha Digital"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: IdScreen(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Cadastrar doações"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: DonationScreen(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Consultar doações"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: DonationList(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Informações"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: InformationScreen(),
        ),

      ],
    );
  }
}
