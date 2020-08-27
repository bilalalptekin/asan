import 'package:tesbihat/pages/model/zikir.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseProvider {
  static const String TABLE_ZIKIR = "zikir";
  static const String COLUMN_ID = "id";
  static const String COLUMN_NAME = "zikirBasligi";
  static const String COLUMN_NUMBERS = "zikirSayisi";
  static const String COLUMN_REMAINDER="kalanZikirSayisi";
  static const String COLUMN_FINISHED = "isFinished";

  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();

  Database _database;

  Future<Database> get database async {
    print("database getter called");

    if (_database != null) {
      return _database;
    }

    _database = await createDatabase();

    return _database;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();

    return await openDatabase(
      join(dbPath, 'foodDB.db'),
      version: 1,
      onCreate: (Database database, int version) async {
        print("Creating food table");

        await database.execute(
          "CREATE TABLE $TABLE_ZIKIR ("
          "$COLUMN_ID INTEGER PRIMARY KEY,"
          "$COLUMN_NAME TEXT,"
          "$COLUMN_NUMBERS TEXT,"
          "$COLUMN_REMAINDER TEXT,"
          "$COLUMN_FINISHED INTEGER"

          ")",
        );
      },
    );
  }

  Future<List<Zikir>> getZikirler() async {
    final db = await database;

    var zikirler = await db
        .query(TABLE_ZIKIR, columns: [COLUMN_ID, COLUMN_NAME, COLUMN_NUMBERS, COLUMN_REMAINDER,COLUMN_FINISHED]);

    List<Zikir> zikirList = List<Zikir>();

    zikirler.forEach((currentFood) {
      Zikir zikir = Zikir.fromMap(currentFood);

      zikirList.add(zikir);
    });

    return zikirList;
  }

  Future<Zikir> insert(Zikir zikir) async {
    final db = await database;
    zikir.id = await db.insert(TABLE_ZIKIR, zikir.toMap());
    return zikir;
  }

  Future<int> delete(int id) async {
    final db = await database;

    return await db.delete(
      TABLE_ZIKIR,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> update(Zikir zikir) async {
    final db = await database;

    return await db.update(
      TABLE_ZIKIR,
      zikir.toMap(),
      where: "id = ?",
      whereArgs: [zikir.id],
    );
  }
}
