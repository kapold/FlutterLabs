import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:lw11/main2.dart';

void main() {
  group('MyApp2', () {
    testWidgets('enterText test', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp2());
      await tester.enterText(find.byType(TextField), 'test input');
      expect(find.text('test input'), findsOneWidget);
    });

    testWidgets('Tap test', (WidgetTester tester) async {
      var tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: ElevatedButton(
            onPressed: () {
              tapped = true;
            },
            child: const Text('Tap me!'),
          ),
        ),
      );
      await tester.tap(find.byType(ElevatedButton));
      expect(tapped, true);
    });

    testWidgets('Drag test', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp2());

      final gesture = await tester.startGesture(const Offset(100, 100));
      await gesture.moveBy(const Offset(100, 100));
      await tester.pump();
      expect(_getContainerMargin(tester), const EdgeInsets.only(left: 100, top: 100));

      await gesture.moveBy(const Offset(100, 0));
      await tester.pump();
      expect(_getContainerMargin(tester), const EdgeInsets.only(left: 200, top: 100));

      await gesture.up();
      await tester.pump();
      expect(_getContainerMargin(tester), const EdgeInsets.only(left: 200, top: 100));
    });
  });
}

EdgeInsets _getContainerMargin(WidgetTester tester) {
  final containerFinder = find.byType(Container);
  final containerWidget = tester.widget<Container>(containerFinder);
  return containerWidget.margin!.resolve(TextDirection.ltr);
}
