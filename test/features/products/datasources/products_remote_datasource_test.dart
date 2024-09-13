import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:klontonk/core/core.dart';
import 'package:klontonk/features/features.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late ProductsRemoteDatasourceImpl datasource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    datasource = ProductsRemoteDatasourceImpl(dio: mockDio);
  });

  group('ProductsRemoteDatasourceImpl', () {
    const productParams = ParamsCreateProduct(
      name: 'Product 1',
      price: 1000,
      categoryName: 'Category 1',
    );

    final productResponseJson = {
      'id': 1,
      'name': 'Product 1',
      'price': 1000,
      'categoryName': 'Category 1',
    };

    test(
        'should create a product and return Success<ProductResponse, Exception>',
        () async {
      // Arrange
      when(
        () => mockDio.post<dynamic>(
          any(),
          data: any(named: 'data'),
        ),
      ).thenAnswer(
        (_) async => Response(
          data: productResponseJson,
          statusCode: 200,
          requestOptions: RequestOptions(),
        ),
      );

      // Act
      final result = await datasource.createProduct(productParams);

      // Assert
      expect(result, isA<Success<ProductResponse, Exception>>());
      final success = result as Success<ProductResponse, Exception>;
      expect(success.value.name, 'Product 1');
      verify(() => mockDio.post<dynamic>(any(), data: any(named: 'data')))
          .called(1);
    });

    test(
        'should return Failure<ProductResponse, Exception> when createProduct fails',
        () async {
      // Arrange
      when(() => mockDio.post<dynamic>(any(), data: any(named: 'data')))
          .thenThrow(
        DioException(
          requestOptions: RequestOptions(),
          response: Response(
            requestOptions: RequestOptions(),
            statusCode: 400,
          ),
        ),
      );

      // Act
      final result = await datasource.createProduct(productParams);

      // Assert
      expect(result, isA<Failure<ProductResponse, Exception>>());
      verify(() => mockDio.post<dynamic>(any(), data: any(named: 'data')))
          .called(1);
    });

    const paramsGetProducts = ParamsGetProducts(page: 1, limit: 10);

    final productsResponseJson = [
      {
        'id': 1,
        'name': 'Product 1',
        'price': 1000,
        'categoryName': 'Category 1',
      },
      {
        'id': 2,
        'name': 'Product 2',
        'price': 2000,
        'categoryName': 'Category 1',
      }
    ];

    test(
        'should get a list of products and return Success<List<ProductResponse>, Exception>',
        () async {
      // Arrange
      when(
        () => mockDio.get<dynamic>(
          any(),
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenAnswer(
        (_) async => Response(
          data: productsResponseJson,
          statusCode: 200,
          requestOptions: RequestOptions(),
        ),
      );

      // Act
      final result = await datasource.getProducts(paramsGetProducts);

      // Assert
      expect(result, isA<Success<List<ProductResponse>, Exception>>());
      final success = result as Success<List<ProductResponse>, Exception>;
      expect(success.value.length, 2);
      verify(
        () => mockDio.get<dynamic>(
          any(),
          queryParameters: any(named: 'queryParameters'),
        ),
      ).called(1);
    });

    test(
        'should return Failure<List<ProductResponse>, Exception> when getProducts fails',
        () async {
      // Arrange
      when(
        () => mockDio.get<dynamic>(
          any(),
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
          response: Response(
            requestOptions: RequestOptions(),
            statusCode: 500,
          ),
        ),
      );

      // Act
      final result = await datasource.getProducts(paramsGetProducts);

      // Assert
      expect(result, isA<Failure<List<ProductResponse>, Exception>>());
      verify(
        () => mockDio.get<dynamic>(
          any(),
          queryParameters: any(named: 'queryParameters'),
        ),
      ).called(1);
    });
  });
}
