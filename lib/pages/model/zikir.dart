import 'package:tesbihat/db/database_provider.dart';

class Zikir {
  int id;
  String zikirBasligi;
  String zikirSayisi;
  String kalanZikirSayisi;
  bool isFinished;


  Zikir({this.id, this.zikirBasligi, this.zikirSayisi,this.kalanZikirSayisi, this.isFinished});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.COLUMN_NAME:zikirBasligi ,
      DatabaseProvider.COLUMN_NUMBERS: zikirSayisi,
       DatabaseProvider.COLUMN_REMAINDER: kalanZikirSayisi,
      DatabaseProvider.COLUMN_FINISHED: isFinished ? 1 : 0
    };

    if (id != null) {
      map[DatabaseProvider.COLUMN_ID] = id;
    }

    return map;
  }

  Zikir.fromMap(Map<String, dynamic> map) {
    id = map[DatabaseProvider.COLUMN_ID];
    zikirBasligi = map[DatabaseProvider.COLUMN_NAME];
    zikirSayisi = map[DatabaseProvider.COLUMN_NUMBERS];
    kalanZikirSayisi=map[DatabaseProvider.COLUMN_REMAINDER];
    isFinished = map[DatabaseProvider.COLUMN_FINISHED] == 1;
  }
}
