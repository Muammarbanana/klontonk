import 'package:flutter/material.dart';
import 'package:klontonk/l10n/l10n.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
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
              decoration: InputDecoration(
                hintText: l10n.productsSearchHint,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(border: Border.all()),
                    child: const Text('Name'),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(border: Border.all()),
                    child: const Text('Price'),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(border: Border.all()),
                    child: const Text('Category'),
                  ),
                ),
              ],
            ),
            Expanded(
              child:
                  ListView.builder(itemBuilder: (_, __) => const Text('test')),
            ),
          ],
        ),
      ),
    );
  }
}
