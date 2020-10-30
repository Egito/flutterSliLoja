import 'package:fluLoja/app/modules/home/models/cce_produto_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

@Injectable()
class CatalogoRepository extends Disposable {
  final HasuraConnect _hasuraConnect;

  CatalogoRepository(this._hasuraConnect);

  Future<List<CceProdutoModel>> getProdutos() async {
    var query = '''query getProdutos {
                    cce_produtos {
                      id
                      descr
                      abrev
                      imagemUrl
                      preco
                      updated_at
                      cce_categoria {
                        descr
                        id
                      }
                    }
                  }''';

    var _snap = await _hasuraConnect.query(query);

    return CceProdutoModel.fromJsonList(_snap["data"]["cce_produtos"] as List);
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
