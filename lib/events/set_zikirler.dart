import 'package:tesbihat/pages/model/zikir.dart';

import 'zikir_event.dart';

class SetZikirler extends ZikirEvent {
  List<Zikir> zikirList;

  SetZikirler(List<Zikir> zikirler) {
    zikirList = zikirler;
  }
}
