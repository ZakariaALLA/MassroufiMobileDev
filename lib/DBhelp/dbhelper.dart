import 'dart:async';

import 'package:daily_spending/models/user.dart';

import '../models/transaction.dart';

import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  // function to create the database
  static Future<sql.Database> getDatabase() async {
    final dbpath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbpath, 'spendings.db'),
        onCreate: (db, version) async {
      await db.execute('CREATE TABLE transactions(id TEXT PRIMARY KEY,title TEXT,amount INTEGER,date TEXT,category TEXT)');
      await db.execute('CREATE TABLE user(id TEXT PRIMARY KEY,username TEXT,password TEXT)');
    }, version: 1);
  }

  //Inserting the transaction data
  static Future<void> insert(Transaction transaction) async {
    final db = await DBHelper.getDatabase();
    await db.insert('transactions', transaction.toMap(transaction),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  //Retereving the transaction data
  static Future<List<Map<String, dynamic>>> fetch() async {
    final sqlDb = await DBHelper.getDatabase();
    return sqlDb.query('transactions');
  }

  //deleting the transactions
  static Future<void> delete(String id) async {
    final sqlDb = await DBHelper.getDatabase();
    await sqlDb.delete('transactions', where: "id=?", whereArgs: [id]);
  }


  static Future<void> insertUser(User user) async {
    final db = await DBHelper.getDatabase();
    await db.insert('user', user.toMap(user),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<void> getMdp(String username) async {
    final sqlDb = await DBHelper.getDatabase();
    await sqlDb.query('users', where: "username=?", whereArgs: [username]);
  }

}