
import 'package:catalog/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Golden Test Example', (widgetTester) async {
    await widgetTester.pumpWidget(MyApp());
    expectLater(find.byType(MyApp), matchesGoldenFile('my_widget.png'));
  });
}