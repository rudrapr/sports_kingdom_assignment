import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../price_bloc/price_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double _kItemExtent = 32.0;

  final List<String> _PriceNames = <String>["EUR", "GBP", "USD"];

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
                itemExtent: _kItemExtent,
                // This is called when selected item is changed.
                onSelectedItemChanged: (int selectedItem) {
                  debugPrint("select: $selectedItem");
                  context
                      .read<PriceBloc>()
                      .add(PriceSelect(currency: _PriceNames[selectedItem]));
                },
                children:
                    List<Widget>.generate(_PriceNames.length, (int index) {
                  return Center(
                    child: Text(
                      _PriceNames[index],
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
