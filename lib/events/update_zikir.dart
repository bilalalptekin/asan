import 'package:tesbihat/pages/model/zikir.dart';

import 'zikir_event.dart';

class UpdateZikir extends ZikirEvent {
  Zikir newZikir;
  int zikirIndex;

  UpdateZikir(int index, Zikir zikir) {
    newZikir = zikir;
    zikirIndex = index;
  }
}