import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sports_kingdom_assignment/global/models/base_exception.dart';
import 'package:sports_kingdom_assignment/global/models/response_model.dart';
import 'package:sports_kingdom_assignment/global/services/api_service.dart';

part 'price_event.dart';

part 'price_state.dart';

class PriceBloc extends Bloc<PriceEvent, PriceState> {
  final ApiService service;
  PriceSelect _lastEvent = PriceSelect(currency: "EUR");
  ResponseModel? _responseModel;

  PriceBloc({required this.service}) : super(PriceInitial()) {
    on<PriceLoad>(_onRequestPriceInit);
    on<PriceSelect>(_onRequestPriceLoad);
  }

  @override
  void onEvent(PriceEvent event) {
    if (event is PriceSelect) {
      _lastEvent = event;
    }
    super.onEvent(event);
  }

  FutureOr<void> _onRequestPriceInit(
      PriceLoad event, Emitter<PriceState> emit) async {
    try {
      var result = await service.getCurrentPrice();
      _responseModel = result;
      emit(PriceSuccess(price: matchPrice(_lastEvent.currency)));
    } on BaseException catch (e) {
      emit(PriceFailure(message: e.message));
    }
  }

  FutureOr<void> _onRequestPriceLoad(
      PriceSelect event, Emitter<PriceState> emit) {
    emit(PriceSuccess(price: matchPrice(_lastEvent.currency)));
  }

  String matchPrice(String name) {
    if (_responseModel == null) return "Price";
    switch (name) {
      case "EUR":
        return _responseModel!.bpi!.eUR!.rate!;
      case "GBP":
        return _responseModel!.bpi!.gBP!.rate!;
      case "USD":
        return _responseModel!.bpi!.uSD!.rate!;
      default:
        return "Price";
    }
  }
}
