import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:klontonk/core/core.dart';
import 'package:klontonk/features/features.dart';
import 'package:klontonk/l10n/l10n.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  // All BLoC goes here
  final _productsBloc = di<ProductsBloc>();

  // Others
  final TextEditingController _searchController = TextEditingController();
  final _pageSize = 10;
  final PagingController<int, ProductResponse> _pagingController =
      PagingController(firstPageKey: 1);
  String? _searchKeyword;
  int _nextPage = 1;

  @override
  void initState() {
    _pagingController.addPageRequestListener(
      (pageKey) {
        return _productsBloc.add(
          GetProductsTriggered(
            params: ParamsGetProducts(
              keyword: _searchKeyword,
              page: pageKey,
              limit: _pageSize,
            ),
          ),
        );
      },
    );
    super.initState();
  }

  @override

  /// Page to show a table of products.
  ///
  /// This page contains a search bar at the top. When the user types something
  /// on the search bar, the table below will show the products that match the
  /// search query. The table will be paginated and will show the products in
  /// the following order: name, price, and category name.
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.productsAppBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: l10n.productsSearchHint,
              ),
            ),
            const SizedBox(height: 16),
            const ProductTableHeader(),
            Expanded(
              child: BlocProvider(
                create: (context) => _productsBloc,
                child: BlocListener<ProductsBloc, ProductsState>(
                  listener: (context, state) {
                    if (state is ProductsLoadSuccess) {
                      if (state.products.length < _pageSize) {
                        _pagingController.appendLastPage(
                          state.products,
                        );
                      } else {
                        _nextPage++;
                        _pagingController.appendPage(
                          state.products,
                          _nextPage,
                        );
                      }
                    } else if (state is ProductsLoadFailure) {
                      _pagingController.error = state.errorMessage;
                    }
                  },
                  child: RefreshIndicator(
                    onRefresh: () => Future.sync(
                      () {
                        _nextPage = 1;
                        _pagingController.refresh();
                      },
                    ),
                    color: Colors.lightBlue,
                    child: PagedListView<int, ProductResponse>(
                      pagingController: _pagingController,
                      builderDelegate:
                          PagedChildBuilderDelegate<ProductResponse>(
                        animateTransitions: true,
                        noItemsFoundIndicatorBuilder: (context) {
                          return const ProductTableRowEmpty();
                        },
                        firstPageProgressIndicatorBuilder: (_) => const Center(
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: CircularProgressIndicator(
                              color: Colors.lightBlue,
                            ),
                          ),
                        ),
                        itemBuilder: (context, item, index) =>
                            ProductTableRow(product: item),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<dynamic>(
              builder: (context) => const CreateProductPage(),
            ),
          ).then((value) {
            _nextPage = 1;
            _pagingController.refresh();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
