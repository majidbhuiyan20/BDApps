import 'package:flutter_test/flutter_test.dart';
import 'package:bdapps/main.dart';

void main() {
  testWidgets('Portfolio smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyPortfolioApp());

    // Verify that the profile name 'Majid Bhuiyan' is displayed.
    expect(find.text('Majid Bhuiyan'), findsOneWidget);

    // Verify that the designation is displayed.
    expect(find.text('Mobile Application Developer (Flutter)'), findsOneWidget);
    
    // Verify that a section title exists.
    expect(find.text('Professional Summary'), findsOneWidget);
  });
}
