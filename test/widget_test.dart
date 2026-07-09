
import 'package:flutter_test/flutter_test.dart';
import 'package:numo/app/app.dart';

void main() {
  testWidgets('Numo app renders', (tester) async {
    await tester.pumpWidget(const NumoApp());

    expect(find.text('Numo'), findsOneWidget);
  });
}
