import 'package:flutter_test/flutter_test.dart';
import 'package:lab9/app.dart';

void main() {
  testWidgets('Clima App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ClimaApp());
    expect(find.byType(ClimaApp), findsOneWidget);
  });
}
