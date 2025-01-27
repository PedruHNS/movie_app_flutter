import 'package:flutter/material.dart';
import 'package:movie_db/app/movie_db_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_db/config/dependencies.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  setup();
  runApp(const MovieDBApp());
}
