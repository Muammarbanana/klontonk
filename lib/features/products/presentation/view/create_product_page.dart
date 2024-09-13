import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klontonk/core/core.dart';
import 'package:klontonk/features/features.dart';
import 'package:klontonk/l10n/l10n.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({super.key});

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _createProductBloc = di<ProductsBloc>();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.productsAddProductButton),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    label: Text(l10n.productsTableHeaderName),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.productsRequiredField;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    label: Text(l10n.productsTableHeaderPrice),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.productsRequiredField;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _categoryController,
                  decoration: InputDecoration(
                    label: Text(l10n.productsTableHeaderCategory),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.productsRequiredField;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                BlocProvider(
                  create: (context) => _createProductBloc,
                  child: BlocConsumer<ProductsBloc, ProductsState>(
                    listener: (context, state) {
                      if (state is ProductsCreateSuccess) {
                        Navigator.pop(context, true);
                      } else if (state is ProductsLoadFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errorMessage),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          if (state is! ProductsLoadInProgress) {
                            if (_formKey.currentState!.validate()) {
                              _createProductBloc.add(
                                CreateProductPressed(
                                  params: ParamsCreateProduct(
                                    name: _nameController.text,
                                    price:
                                        int.tryParse(_priceController.text) ??
                                            0,
                                    categoryName: _categoryController.text,
                                  ),
                                ),
                              );
                            }
                          }
                        },
                        child: (state is ProductsLoadInProgress)
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(l10n.productsAddProductButton),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
