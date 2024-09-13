import 'package:klontonk/core/core.dart';
import 'package:klontonk/features/features.dart';

class CreateProduct {
  const CreateProduct({required this.datasource});

  final ProductsRemoteDatasource datasource;
  Future<Result<ProductResponse, Exception>> call(
    ParamsCreateProduct params,
  ) async {
    final result = await datasource.createProduct(params);
    return result;
  }
}
