import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget _buildBodyBack() => Container(//degrade
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 250, 110, 128),
              Color.fromARGB(255, 193, 148, 151),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
      ),
    );


    return Stack(
      children: <Widget>[
        _buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Inicio"),
                centerTitle: true,
              ),
            ),
            /* FutureBuilder <QuerySnapshot>( //função que pega os dados do usuário do banco e constroi a carteirinha digital
                future: Firestore.instance.collection("user").getDocuments(),
                builder: (context,snapshot){
                  if(!snapshot.hasData)
                    return SliverToBoxAdapter( //como estamos detro de uma sliver precisa ser adaptado para que o sistema exiba a barra de progresso enquanto pesquisa os dados
                      child: Container(
                        height: 200,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    );
                  else
                    return SliverStaggeredGrid.count();//retornar aqui os dados do usuário
                },
            )*/
          ],
        )
      ],
    );
  }
}

