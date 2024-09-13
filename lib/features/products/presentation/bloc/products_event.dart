part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class CreateProductPressed extends ProductsEvent {
  const CreateProductPressed({required this.params});

  final ParamsCreateProduct params;

  @override
  List<Object> get props => [params];
}

class GetProductsTriggered extends ProductsEvent {
  const GetProductsTriggered({required this.params});

  final ParamsGetProducts params;

  @override
  List<Object> get props => [params];
}
