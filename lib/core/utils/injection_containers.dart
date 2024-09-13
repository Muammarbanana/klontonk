import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:klontonk/core/core.dart';
import 'package:klontonk/features/features.dart';

final di = GetIt.instance;

void init() {
  di

    // Remote Datasources
    ..registerLazySingleton<ProductsRemoteDatasource>(
      () => ProductsRemoteDatasourceImpl(
        dio: di(),
      ),
    )

    // Usecases
    ..registerFactory(() => CreateProduct(datasource: di()))
    ..registerFactory(() => GetProducts(datasource: di()))

    // Blocs
    ..registerFactory(
      () => ProductsBloc(
        createProduct: di(),
        getProducts: di(),
      ),
    )

    // Others
    ..registerLazySingleton(() {
      final options = BaseOptions(
        connectTimeout: const Duration(seconds: 60), //20 seconds
        receiveTimeout: const Duration(seconds: 60),
      );
      final dio = Dio(options);
      dio.interceptors.addAll([
        DioLoggingInterceptor(),
      ]);

      return dio;
    });
}
