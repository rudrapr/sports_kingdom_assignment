// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sports_kingdom_assignment/app.dart';
import 'package:sports_kingdom_assignment/home/price_bloc/price_bloc.dart';

import 'package:sports_kingdom_assignment/main.dart';

import 'mock_api_service.dart';

void main() {
  testWidgets('Price Select Test -', (WidgetTester tester) async {
    // Build out the app
    await tester.pumpWidget(BlocProvider<PriceBloc>(
      create: (context) =>
          PriceBloc(service: MockApiService())..add(PriceLoad()),
      child: const MyApp(),
    ));

    // Verify the default price.
    expect(find.text('Price'), findsOneWidget);

    // Find the default option (the first one)
    final currencySelector = find.text('EUR').last;

    // Apply an offset to scroll
    const offset = Offset(0, -10000);

    // Use both methods: fling and drag
    await tester.fling(
      currencySelector,
      offset,
      1000,
      warnIfMissed: false,
    );

    await tester.drag(
      currencySelector,
      offset,
      warnIfMissed: false,
    );
    await tester.pump();

    // Verify that the USD price is Selected.
    expect(find.text('Price'), findsNothing);

    expect(find.text('USD'), findsOneWidget);
    expect(find.text('16,690.6369'), findsOneWidget);
  });
}
