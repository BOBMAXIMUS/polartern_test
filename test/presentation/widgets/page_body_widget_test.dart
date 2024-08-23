import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polartern_test_app/presentation/widgets/avatar_display_widget.dart';
import 'package:polartern_test_app/presentation/widgets/page_body_widget.dart';
import 'package:polartern_test_app/presentation/widgets/page_title_and_share_widget.dart';
import 'package:polartern_test_app/presentation/widgets/title_info_widget.dart';

void main() {
  testWidgets('PageBodyWidget renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              PageBodyWidget(),
            ],
          ),
        ),
      ),
    );

    expect(find.byType(ShareScreenWidget), findsOneWidget);

    expect(
      find.byType(TitleAndInfoWidget),
      findsNWidgets(3),
    );

    expect(find.byType(AvatarWidget), findsOneWidget);

    expect(
      find.text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
      findsOneWidget,
    );
  });

  testWidgets('PageBodyWidget contains correct TitleAndInfoWidgets',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              PageBodyWidget(),
            ],
          ),
        ),
      ),
    );

    expect(find.widgetWithText(TitleAndInfoWidget, "Date and Time"),
        findsOneWidget);
    expect(find.widgetWithText(TitleAndInfoWidget, "Cost"), findsOneWidget);
    expect(find.widgetWithText(TitleAndInfoWidget, "Location"), findsOneWidget);
  });

  testWidgets('PageBodyWidget renders avatars correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              PageBodyWidget(),
            ],
          ),
        ),
      ),
    );

    final avatarWidget = tester.widget<AvatarWidget>(
      find.byType(AvatarWidget),
    );
    expect(
        avatarWidget.avatars,
        containsAll([
          'assets/avatar/avatar_1.png',
          'assets/avatar/avatar_2.png',
          'assets/avatar/avatar_3.png',
        ]));
  });
}
