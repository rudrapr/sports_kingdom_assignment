part of 'price_bloc.dart';

@immutable
abstract class PriceEvent extends Equatable {}

class PriceLoad extends PriceEvent {
  @override
  List<Object?> get props => [];
}

class PriceSelect extends PriceEvent {
  @override
  List<Object?> get props => [currency];
  final String currency;

  PriceSelect({required this.currency});
}
