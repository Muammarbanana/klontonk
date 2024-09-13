part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoadInProgress extends ProductsState {}

class ProductsCreateSuccess extends ProductsState {
  const ProductsCreateSuccess({required this.product});
  final ProductResponse product;

  @override
  List<Object> get props => [];
}

class ProductsLoadSuccess extends ProductsState {
  const ProductsLoadSuccess({required this.products});
  final List<ProductResponse> products;

  @override
  List<Object> get props => [products];
}

class ProductsLoadFailure extends ProductsState {
  const ProductsLoadFailure({required this.errorMessage});
  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
