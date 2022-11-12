import 'package:accessibility_keynote/main.dart';
import 'package:accessibility_keynote/fixed_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('text factor issue', (tester) async {
    tester.binding.window.platformDispatcher.textScaleFactorTestValue = 1;

    // resets the text scale factor to its original size after the test end
    addTearDown(
      tester.binding.window.platformDispatcher.clearTextScaleFactorTestValue,
    );

    await tester.pumpWidget(
      MaterialApp(
        theme: appTheme,
        home: const HomePage(),
      ),
    );

    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('large_fonts.png'),
    );
  }, skip: true);

  testWidgets('tap targets', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: appTheme,
        home: const HomePage(),
      ),
    );

    expect(tester, meetsGuideline(labeledTapTargetGuideline));
  }, skip: true);

  testWidgets('tap targets', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: appTheme,
        home: const HomePage(),
      ),
    );

    expect(tester, meetsGuideline(androidTapTargetGuideline));
  }, skip: true);

  testWidgets('tap targets', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: appTheme,
        home: const HomePage(),
      ),
    );

    expect(
      tester,
      meetsGuideline(iOSTapTargetGuideline),
      skip: true,
    );
  });

  testWidgets('tap targets', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: appTheme,
        home: const HomePage(),
      ),
    );

    expect(
      tester,
      meetsGuideline(textContrastGuideline),
    );
  });
}
