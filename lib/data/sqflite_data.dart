import 'package:aplicativo_maria/models/message_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteData {
  Future<Database> getDatabase() async {
    final path = await getDatabasesPath();
    final database = await openDatabase(
      join(path, 'message_database.db'),
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE MESSAGE(
            id TEXT PRIMARY KEY,
            message TEXT NOT NULL,
            description TEXT NOT NULL
            )
          ''');
      },
      version: 1,
    );
    return database;
  }

  Future<List<MessageModel>> retrieveAll() async {
    final database = await getDatabase();
    final data = await database.query('MESSAGE');
    return data.map((map) => MessageModel.fromMap(map)).toList();
  }

  Future deleteTuple(String messageId) async {
    final database = await getDatabase();
    database.delete('MESSAGE', where: 'id = ?', whereArgs: [messageId]);
  }

  Future updateData(MessageModel message) async {
    final database = await getDatabase();
    database.update('MESSAGE', message.toMap(), where: "id = ?", whereArgs: [message.id]);
  }

  Future insertData(MessageModel message) async {
    final database = await getDatabase();
    await database.insert('MESSAGE', message.toMap());
  }

  Future deleteAllFromTable() async {
    final database = await getDatabase();
    await database.rawDelete("DELETE FROM MESSAGE");
  }

  Future deleteTable() async {
    final database = await getDatabase();
    await database.rawDelete("DELETE TABLE MESSAGE");
  }
}