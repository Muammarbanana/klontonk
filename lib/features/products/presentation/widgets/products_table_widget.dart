import 'package:flutter/material.dart';

import 'package:klontonk/features/features.dart';
import 'package:klontonk/l10n/l10n.dart';

class ProductTableHeader extends StatelessWidget {
  const ProductTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(color: Colors.lightBlue),
            child: Text(
              l10n.productsTableHeaderName,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(color: Colors.lightBlue),
            child: Text(
              l10n.productsTableHeaderPrice,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(color: Colors.lightBlue),
            child: Text(
              l10n.productsTableHeaderCategory,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class ProductTableRow extends StatelessWidget {
  const ProductTableRow({required this.product, super.key});

  final ProductResponse product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(border: Border.all()),
            child: Text(
              product.name.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(border: Border.all()),
            child: Text(product.price.toString()),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(border: Border.all()),
            child: Text(product.categoryName.toString()),
          ),
        ),
      ],
    );
  }
}

class ProductTableRowEmpty extends StatelessWidget {
  const ProductTableRowEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(border: Border.all()),
      width: double.infinity,
      child: Center(
        child: Text(
          context.l10n.productsEmptyContent,
        ),
      ),
    );
  }
}
