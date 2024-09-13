import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:klontonk/app/app.dart';
import 'package:klontonk/features/features.dart';

void main() async {
  setUp(() {
    dotenv.testLoad(
      fileInput: '''
          BASE_URL=TEST_BASE_URL 
      ''',
    );
  });
  group('App', () {
    testWidgets('renders ProductsPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(ProductsPage), findsOneWidget);
    });
  });
}
