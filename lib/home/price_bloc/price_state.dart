part of 'price_bloc.dart';

@immutable
abstract class PriceState extends Equatable {}

class PriceInitial extends PriceState {
  @override
  List<Object?> get props => [];
}

class PriceLoading extends PriceState {
  @override
  List<Object?> get props => [];
}

class PriceSuccess extends PriceState {
  @override
  List<Object?> get props => [price];
  final String price;
  final String? message;

  PriceSuccess({required this.price, this.message});
}

class PriceFailure extends PriceState {
  @override
  List<Object?> get props => [message];

  final String message;

  PriceFailure({required this.message});
}
