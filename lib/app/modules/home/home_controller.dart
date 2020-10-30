import 'package:fluLoja/app/modules/home/models/cce_produto_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:fluLoja/app/modules/home/repositories/catalogo_repository.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final CatalogoRepository _repository;

  _HomeControllerBase(this._repository) {
    _repository.getProdutos().then((value) => wProdutos = value);
  }

  @observable
  List<CceProdutoModel> wProdutos = [];
}
