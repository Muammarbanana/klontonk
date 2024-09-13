import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:klontonk/app/app.dart';
import 'package:klontonk/bootstrap.dart';

void main() async {
  await dotenv.load(fileName: '.env_development');
  await bootstrap(() => const App());
}
