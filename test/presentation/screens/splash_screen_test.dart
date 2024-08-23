import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polartern_test_app/presentation/screens/home_screen.dart';
import 'package:polartern_test_app/presentation/screens/splash_screen.dart';

void main() {
  testWidgets('SplashScreen navigates to HomeScreen after delay',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const SplashScreen(),
        routes: {
          '/home': (context) => HomeScreen(),
        },
      ),
    );

    await tester.pump(const Duration(seconds: 3));

    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);
  });

  testWidgets('SplashScreen does not navigate before delay',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const SplashScreen(),
        routes: {
          '/home': (context) => HomeScreen(),
        },
      ),
    );

    await tester.pump(const Duration(seconds: 1));

    expect(find.byType(HomeScreen), findsNothing);

    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
