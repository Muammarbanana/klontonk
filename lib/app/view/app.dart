import 'package:flutter/material.dart';
import 'package:klontonk/core/core.dart';
import 'package:klontonk/features/features.dart';

import 'package:klontonk/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const ProductsPage(),
    );
  }
}
