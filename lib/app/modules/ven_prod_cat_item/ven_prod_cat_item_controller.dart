import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'ven_prod_cat_item_controller.g.dart';

@Injectable()
class VenProdCatItemController = _VenProdCatItemControllerBase
    with _$VenProdCatItemController;

abstract class _VenProdCatItemControllerBase with Store {}
