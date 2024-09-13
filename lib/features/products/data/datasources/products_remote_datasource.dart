import 'package:dio/dio.dart';
import 'package:klontonk/core/core.dart';
import 'package:klontonk/features/features.dart';

abstract class ProductsRemoteDatasource {
  Future<Result<ProductResponse, Exception>> createProducts(
      ParamsCreateProducts params);
  Future<Result<List<ProductResponse>, Exception>> getProducts(
    ParamsGetProducts params,
  );
}

class ProductsRemoteDatasourceImpl
    with ErrorHandling
    implements ProductsRemoteDatasource {
  ProductsRemoteDatasourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<Result<ProductResponse, Exception>> createProducts(
    ParamsCreateProducts params,
  ) async {
    try {
      final response = await dio.post(
        '/products',
        data: params.toMap(),
      );
      return Success<ProductResponse, Exception>(
        ProductResponse.fromJson(response.data as Map<String, dynamic>),
      );
    } on Exception catch (e) {
      return handleException<ProductResponse>(e);
    }
  }

  @override
  Future<Result<List<ProductResponse>, Exception>> getProducts(
    ParamsGetProducts params,
  ) async {
    try {
      final response = await dio.get(
        '/products',
        queryParameters: params.toMap(),
      );
      final dataList = <ProductResponse>[];
      for (final json in response.data as List<Map<String, dynamic>>) {
        dataList.add(ProductResponse.fromJson(json));
      }

      return Success<List<ProductResponse>, Exception>(dataList);
    } on Exception catch (e) {
      return handleException<List<ProductResponse>>(e);
    }
  }
}
