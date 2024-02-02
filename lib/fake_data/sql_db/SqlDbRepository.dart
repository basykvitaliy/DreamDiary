import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dream_diary/fake_data/model/dream_model.dart';
import 'package:dream_diary/helpers/constants.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqlDbRepository {
  static final SqlDbRepository instance = SqlDbRepository._instance();
  static Database? _db;
  SqlDbRepository._instance();

  Status? _status = Status.unknown;

  /// Dream model.
  String dreamTable = "dream_table";
  String colId = "id";
  String colTitle = "title";
  String colSleepTime = "sleepTime";
  String colDescription = "description";
  String colMoments = "moments";
  String colEmotions = "emotions";
  String colCharacters = "characters";
  /// Dream model.

  Future<Database> get db async {
    _db ??= await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    //String path = dir.path + "db";
    String path = p.join(dir.toString(),"db");
    final table = await openDatabase(path, version: 1, onCreate: _onCreate);
    return table;
  }

  void _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $dreamTable("
        "$colId INTEGER PRIMARY KEY AUTOINCREMENT, "
        "$colTitle TEXT, "
        "$colSleepTime TEXT, "
        "$colDescription TEXT, "
        "$colMoments TEXT, "
        "$colEmotions TEXT, "
        "$colCharacters TEXT) "
    );
  }

  Future<List<DreamModel>> getDreams() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> dreamsList = await db.query(dreamTable);
    final List<DreamModel> dreams = [];
    for (var element in dreamsList) {
      List<String> emotionsList = [];
      if (element[colEmotions] != null) {
        emotionsList = List<String>.from(jsonDecode(element[colEmotions]));
      }
      DreamModel dream = DreamModel(
        id: element[colId],
        title: element[colTitle],
        sleepTime: element[colSleepTime],
        description: element[colDescription],
        moments: element[colMoments],
        emotions: emotionsList,
        characters: element[colCharacters],
      );
      dreams.add(dream);
    }
    return dreams;
  }

  Future<Status> insertDream(DreamModel dream) async {
    Database db = await this.db;
    Map<String, dynamic> dreamJson = dream.toJson();
    dreamJson[colEmotions] = jsonEncode(dreamJson[colEmotions]);

    final result = await db.insert(dreamTable, dreamJson);
    if(result != -1){
      _status = Status.successful;
    }else{
      _status = Status.error;
    }
    return _status!;
  }

  /// Search
  // Future<List<dynamic>> searchAll(String query) async {
  //   List<dynamic> searchResults = [];
  //
  //   // Пошук в таблиці PersonalCardModel
  //   List<PersonalCardModel> personalCardResults = await searchPersonalCards(query);
  //   searchResults.addAll(personalCardResults);
  //
  //   return searchResults;
  // }
  //
  // Future<List<PersonalCardModel>> searchPersonalCards(String query) async {
  //   Database db = await this.db;
  //   final List<Map<String, dynamic>> maps = await db.query(
  //     personalCardTable,
  //     where: '$colPersonalCardName LIKE ?',
  //     whereArgs: ['%$query%'],
  //   );
  //   List<PersonalCardModel> searchResults = [];
  //   for (final map in maps) {
  //     PersonalCardModel card = PersonalCardModel.fromJson(map);
  //     searchResults.add(card);
  //   }
  //   return searchResults;
  // }
  /// Search
}
