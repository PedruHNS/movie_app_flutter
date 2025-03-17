import 'package:movie_db/utils/result.dart';

abstract interface class AuthRepository {
  Future<bool> isFirstAccess();
  Future<Result<String>> createRequestToken();
}
