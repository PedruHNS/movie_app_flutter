
import 'package:flutter/material.dart';
import 'package:movie_db/app/movie_db_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  runApp(const MovieDBApp());
}
