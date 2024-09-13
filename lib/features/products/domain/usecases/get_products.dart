import 'package:klontonk/core/core.dart';
import 'package:klontonk/features/features.dart';

class GetProducts {
  const GetProducts({required this.datasource});

  final ProductsRemoteDatasource datasource;
  Future<Result<List<ProductResponse>, Exception>> call(
    ParamsGetProducts params,
  ) async {
    final result = await datasource.getProducts(params);
    return result;
  }
}
