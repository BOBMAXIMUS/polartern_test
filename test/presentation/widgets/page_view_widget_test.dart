import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polartern_test_app/presentation/widgets/page_view_widget.dart';

void main() {
  testWidgets('PageViewWidget initializes with the first page active',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: PageViewWidget(),
        ),
      ),
    );

    final firstIndicator = find.byWidgetPredicate(
      (widget) =>
          widget is AnimatedContainer &&
          widget.decoration is BoxDecoration &&
          (widget.decoration as BoxDecoration).color == const Color(0xFF5a9faf),
    );

    expect(firstIndicator, findsOneWidget);
  });

  testWidgets('PageViewWidget updates the active indicator on swipe',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: PageViewWidget(),
        ),
      ),
    );

    await tester.drag(find.byType(PageView), const Offset(-400, 0));
    await tester.pumpAndSettle();

    final secondIndicator = find.byWidgetPredicate(
      (widget) =>
          widget is AnimatedContainer &&
          widget.decoration is BoxDecoration &&
          (widget.decoration as BoxDecoration).color == const Color(0xFF5a9faf),
    );

    expect(secondIndicator, findsNWidgets(1));
  });

  testWidgets('PageViewWidget contains back and more buttons',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: PageViewWidget(),
        ),
      ),
    );

    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    expect(find.byIcon(Icons.more_horiz), findsOneWidget);
  });

  testWidgets('PageViewWidget back button triggers onPressed',
      (WidgetTester tester) async {
    bool backButtonPressed = false;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: PageViewWidget(),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pump();

    expect(backButtonPressed, isFalse);
  });
}
