import 'package:get_it/get_it.dart';
import 'package:movie_db/data/repositories/movies_repository/movies_repository.dart';
import 'package:movie_db/data/repositories/movies_repository/movies_repository_impl.dart';
import 'package:movie_db/data/services/movies_service/movies_service.dart';
import 'package:movie_db/data/services/movies_service/movies_service_impl.dart';
import 'package:movie_db/ui/details/view_model/details_vm.dart';
import 'package:movie_db/ui/home/view_model/home_vm.dart';
import 'package:movie_db/utils/restclient/rest_client.dart';
import 'package:movie_db/utils/restclient/rest_client_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<RestClient>(RestClientImpl());

  getIt.registerFactory<MoviesService>(
    () => MoviesServiceImpl(
      client: getIt<RestClient>(),
    ),
  );

  getIt.registerLazySingleton<MoviesRepository>(
    () => MoviesRepositoryImpl(
      movieService: getIt<MoviesService>(),
    ),
  );

  getIt.registerLazySingleton<HomeVm>(
      () => HomeVm(moviesRepository: getIt<MoviesRepository>()));

  getIt.registerFactory<DetailsVm>(
    () => DetailsVm(getIt<MoviesRepository>()),
  );
}
