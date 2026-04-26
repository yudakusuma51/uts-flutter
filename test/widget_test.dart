import 'package:flutter_test/flutter_test.dart';
import 'package:appmobile/main.dart';

void main() {
  testWidgets('Login screen appears', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('APP MOBILE'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });
}
