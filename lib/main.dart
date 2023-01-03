import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_kingdom_assignment/global/services/api_service.dart';
import 'app.dart';
import 'home/price_bloc/price_bloc.dart';

void main() {
  runApp(BlocProvider<PriceBloc>(
    create: (context) => PriceBloc(service: ApiService())..add(PriceLoad()),
    child: const MyApp(),
  ));
}
