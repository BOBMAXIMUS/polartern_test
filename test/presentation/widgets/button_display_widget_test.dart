import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polartern_test_app/presentation/widgets/button_display_widget.dart';

void main() {
  testWidgets('Initial state of the slider is correct',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ButtonDisplayWidget(),
        ),
      ),
    );

    expect(find.text("Swipe to RSVP"), findsOneWidget);

    final slider = tester.widget<Slider>(find.byType(Slider));
    expect(slider.value, equals(0.0));
  });

  testWidgets('Slider moves and triggers navigation callback',
      (WidgetTester tester) async {
    bool navigationTriggered = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ButtonDisplayWidget(
            onNavigate: () {
              navigationTriggered = true;
            },
            delayDuration: const Duration(
              milliseconds: 10,
            ),
          ),
        ),
      ),
    );

    expect(find.text("Swipe to RSVP"), findsOneWidget);

    await tester.drag(find.byType(Slider), const Offset(785, 0));
    await tester.pump();

    final slider = tester.widget<Slider>(find.byType(Slider));
    expect(slider.value, equals(1.0));

    expect(find.text("RSVP'd"), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 10));

    expect(navigationTriggered, isTrue);
  });
  testWidgets('Slider resets if not fully moved', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ButtonDisplayWidget(),
        ),
      ),
    );

    await tester.drag(find.byType(Slider), const Offset(100, 0));
    await tester.pump();

    final slider = tester.widget<Slider>(find.byType(Slider));
    expect(slider.value, isNot(equals(1.0)));

    await tester.pump(const Duration(milliseconds: 100));

    final resetSlider = tester.widget<Slider>(find.byType(Slider));
    expect(resetSlider.value, equals(0.0));
  });
}
