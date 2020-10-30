import 'add_produto_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'add_produto_page.dart';

class AddProdutoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $AddProdutoController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => AddProdutoPage()),
      ];

  static Inject get to => Inject<AddProdutoModule>.of();
}
