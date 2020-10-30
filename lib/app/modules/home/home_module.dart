import 'package:fluLoja/app/modules/ven_prod_cat_item/ven_prod_cat_item_controller.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'repositories/catalogo_repository.dart';
import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Repositorios
        Bind((inject) => CatalogoRepository(inject.get<HasuraConnect>())),
        // Controladores
        Bind((inject) => VenProdCatItemController()),
        Bind((inject) => HomeController(inject.get<CatalogoRepository>())),
        // Conectores
        Bind((inject) => HasuraConnect("http://192.168.1.81:8080/v1/graphql")),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
