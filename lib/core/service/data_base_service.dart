import 'dart:convert';
import 'dart:developer' show log;
import 'package:path/path.dart';
import 'package:sakina_app/features/reminder/data/models/reminder_model.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseService {
  static final DataBaseService instance = DataBaseService._constructor();

  DataBaseService._constructor();

  final String _reminderTableName = 'reminders';
  final String _reminderColumnID = 'Id';
  final String _reminderColumnTitle = 'title';
  final String _reminderColumnTime = 'time';
  final String _reminderColumnIcon = 'icon';
  final String _reminderColumnColors = 'colors';
  final String _reminderColumnEnabled = 'enabled';
  final String _reminderColumnRepeated = 'repeatedEveryday';

  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;

    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, 'master_db.db');

    final database = await openDatabase(
      databasePath,
      version: 1,

      onOpen: (db) {
        print('Database opened');
      },

      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE $_reminderTableName(
          $_reminderColumnID INTEGER PRIMARY KEY,
          $_reminderColumnTitle TEXT NOT NULL,
          $_reminderColumnTime TEXT NOT NULL,
          $_reminderColumnIcon INTEGER,
          $_reminderColumnColors TEXT,
          $_reminderColumnEnabled INTEGER,
$_reminderColumnRepeated INTEGER

        )
        ''');
      },
    );

    return database; // ✅ مهم جدًا
  }

  Future<int> addReminder(ReminderModel reminder) async {
    final db = await database;

    final int id = await db.insert(
      _reminderTableName,
      {
        _reminderColumnTitle: reminder.title,
        _reminderColumnTime: reminder.time,
        _reminderColumnIcon: reminder.iconCode,
        _reminderColumnColors: jsonEncode(
          reminder.colors.map((c) => c.value).toList(),
        ),
        _reminderColumnEnabled: reminder.isEnabled ? 1 : 0,
        _reminderColumnRepeated: reminder.repeatedEveryday ? 1 : 0,
      },
    );

    return id; // 👈 ده المهم
  }

  Future<List<ReminderModel>> getAllReminders() async {
    final db = await database;
    final data = await db.query(_reminderTableName);

    final reminders = data.map((data) => ReminderModel.fromMap(data)).toList();
    log(reminders.toString());
    return reminders;
  }

  Future<void> updateReminderEnabled({
    required int id,
    required bool isEnabled,
  }) async {
    final db = await database;

    await db.update(
      _reminderTableName,

      {_reminderColumnEnabled: isEnabled ? 1 : 0},

      where: '$_reminderColumnID = ?',
      whereArgs: [id],
    );
  }
}
