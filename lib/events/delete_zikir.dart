import 'zikir_event.dart';

class DeleteZikir extends ZikirEvent {
  int zikirIndex;

  DeleteZikir(int index) {
    zikirIndex = index;
  }
}
