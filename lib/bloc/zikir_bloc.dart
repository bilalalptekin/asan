import 'package:tesbihat/events/add_zikir.dart';
import 'package:tesbihat/events/delete_zikir.dart';
import 'package:tesbihat/events/zikir_event.dart';
import 'package:tesbihat/events/set_zikirler.dart';
import 'package:tesbihat/events/update_zikir.dart';
import 'package:tesbihat/pages/model/zikir.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ZikirBloc extends Bloc<ZikirEvent, List<Zikir>> {
  @override
  List<Zikir> get initialState => List<Zikir>();

  @override
  Stream<List<Zikir>> mapEventToState(ZikirEvent event) async* {
    if (event is SetZikirler) {
      yield event.zikirList;
    } else if (event is AddZikir) {
      List<Zikir> newState = List.from(state);
      if (event.newZikir != null) {
        newState.add(event.newZikir);
      }
      yield newState;
    } else if (event is DeleteZikir) {
      List<Zikir> newState = List.from(state);
      newState.removeAt(event.zikirIndex);
      yield newState;
    } else if (event is UpdateZikir) {
      List<Zikir> newState = List.from(state);
      newState[event.zikirIndex] = event.newZikir;
      yield newState;
    }
  }
}
