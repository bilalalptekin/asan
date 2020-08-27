import 'package:tesbihat/pages/model/zikir.dart';

import 'zikir_event.dart';

class AddZikir extends ZikirEvent {
  Zikir newZikir;

  AddZikir(Zikir zikir) {
    newZikir = zikir;
  }
}
