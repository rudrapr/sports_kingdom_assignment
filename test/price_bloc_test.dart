import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sports_kingdom_assignment/home/price_bloc/price_bloc.dart';

import 'mock_api_service.dart';

void main() {
  group('PriceBloc Testing -', () {
    late PriceBloc priceBloc;

    setUp(() {
      priceBloc = PriceBloc(service: MockApiService());
      priceBloc.add(PriceLoad());
    });

    blocTest('When USD is Selected then the price is',
        build: () => priceBloc,
        act: (bloc) => bloc.add(PriceSelect(currency: "USD")),
        expect: () => <PriceState>[PriceSuccess(price: "16,690.6369")]);

    blocTest('When INR is Selected then the price is',
        build: () => priceBloc,
        act: (bloc) => bloc.add(PriceSelect(currency: "INR")),
        expect: () => <PriceState>[PriceSuccess(price: "Price")]);
  });
}
