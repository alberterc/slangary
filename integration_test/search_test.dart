import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:slangary/main.dart';
import 'package:slangary/views/result/result.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  test(
      'GIVEN a term WHEN an API request to "define" that term is sent THEN return a list of definitions',
      () async {});

  group('Search button tapped', () {
    testWidgets('GIVEN the user does not enter a term THEN do not do anything',
        (tester) async {
      await tester.pumpWidget(const SlangaryApp());

      final termTextField = find.byType(TextField).first;
      final termTextFieldWidget = tester.widget<TextField>(termTextField);
      final searchButton = find.byKey(const Key('search_button'));

      // Check if the termTextField is empty
      expect(termTextFieldWidget.controller!.text, '');

      await tester.tap(searchButton);
      await tester.pumpAndSettle();
      final resultPage = find.byType(ResultPage);

      expect(resultPage, findsNothing);
    });

    testWidgets(
        'GIVEN the user does enter a term WHEN there is no result returned THEN show a string indicating that and go back to the home page',
        (tester) async {
      await tester.pumpWidget(const SlangaryApp());

      final termTextField = find.byType(TextField).first;
      final termTextFieldWidget = tester.widget<TextField>(termTextField);
      final searchButton = find.byKey(const Key('search_button'));
      const term = 'alksdjalskdjalsdkjasd';

      await tester.enterText(termTextField, term);

      // Check if the termTextField's text is correct
      expect(termTextFieldWidget.controller!.text, term);

      await tester.tap(searchButton);
      await tester.pumpAndSettle();
      final resultPage = find.byType(ResultPage);

      expect(resultPage, findsOneWidget);
      expect(find.text('There is no result for $term.'), findsOneWidget);

      // Go back to the home page
      await tester.tap(find.byKey(const Key('search_page_button')));
    });

    testWidgets(
        'GIVEN the user does enter a term WHEN there is result returned THEN show a list of results',
        (tester) async {
      await tester.pumpWidget(const SlangaryApp());

      final termTextField = find.byType(TextField).first;
      final termTextFieldWidget = tester.widget<TextField>(termTextField);
      final searchButton = find.byKey(const Key('search_button'));
      final resultList = find.byType(ListView);
      const term = 'tyu';

      await tester.enterText(termTextField, term);

      // Check if the termTextField's text is correct
      expect(termTextFieldWidget.controller!.text, term);

      await tester.tap(searchButton);
      await tester.pumpAndSettle();
      final resultPage = find.byType(ResultPage);

      expect(resultPage, findsOneWidget);
      expect(resultList, findsOneWidget);
    });
  });
}
