import 'package:fluLoja/app/modules/home/home_module.dart';
import 'package:fluLoja/app/modules/ven_prod_cat_item/ven_prod_cat_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  HomeController homeControl = HomeModule.to.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (BuildContext context) {
          return ListView.builder(
            itemCount: homeControl.wProdutos.length,
            itemBuilder: (BuildContext context, int index) {
              return VenProdCatItemWidget(
                wDescr: homeControl.wProdutos[index].descr,
                wPreco: "R\$ ${homeControl.wProdutos[index].preco}",
                wCateg: homeControl.wProdutos[index].cceCategoria.descr,
                wImagem: homeControl.wProdutos[index].imagemUrl,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/NovoProduto");
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
