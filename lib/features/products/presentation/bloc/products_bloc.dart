import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:klontonk/core/core.dart';

import 'package:klontonk/features/features.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({
    required this.createProduct,
    required this.getProducts,
  }) : super(ProductsInitial()) {
    on<CreateProductPressed>(_createProductPressed);
    on<GetProductsTriggered>(_getProductsTriggered);
  }

  final CreateProduct createProduct;
  final GetProducts getProducts;

  Future<void> _createProductPressed(
    CreateProductPressed event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoadInProgress());
    final result = await createProduct(event.params);
    switch (result) {
      case Success(value: final product):
        emit(ProductsCreateSuccess(product: product));
      case Failure(exception: final exception):
        emit(ProductsLoadFailure(errorMessage: exception.toString()));
      default:
    }
  }

  Future<void> _getProductsTriggered(
    GetProductsTriggered event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoadInProgress());
    final result = await getProducts(event.params);
    switch (result) {
      case Success(value: final products):
        emit(ProductsLoadSuccess(products: products));
      case Failure(exception: final exception):
        emit(ProductsLoadFailure(errorMessage: exception.toString()));
      default:
    }
  }
}
