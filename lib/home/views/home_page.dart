import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../price_bloc/price_bloc.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<String> _priceNames = <String>["EUR", "GBP", "USD"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 80),
              child: Image.asset(
                "assets/img_btc.png",
                height: 100,
                width: 100,
              ),
            ),
            BlocBuilder<PriceBloc, PriceState>(
              builder: (context, state) {
                if (state is PriceSuccess) {
                  return Text(
                    state.price,
                    style: const TextStyle(
                        color: Color(0xffF6B42F),
                        fontWeight: FontWeight.w300,
                        fontSize: 56),
                  );
                }
                return const Text(
                  "Price",
                  style: TextStyle(
                      color: Color(0xffF6B42F),
                      fontWeight: FontWeight.w300,
                      fontSize: 56),
                );
              },
            ),
            Expanded(
              child: CupertinoPicker(
                magnification: 1.22,
                squeeze: 1.2,
                useMagnifier: true,
                itemExtent: 32,
                // This is called when selected item is changed.
                onSelectedItemChanged: (int selectedItem) {
                  debugPrint("select: $selectedItem");
                  context
                      .read<PriceBloc>()
                      .add(PriceSelect(currency: _priceNames[selectedItem]));
                },
                children:
                    List<Widget>.generate(_priceNames.length, (int index) {
                  return Center(
                    child: Text(
                      _priceNames[index],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
