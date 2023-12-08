part of 'portfolio_cubit.dart';

@immutable
class PortfolioState extends Equatable {
  final List<Coin> watchList;
  final PortfolioStateType type;
  final String? message;

  const PortfolioState({
    this.watchList = const [],
    this.type = PortfolioStateType.idle,
    this.message,
  });

  PortfolioState copyWith({
    List<Coin>? watchList,
    PortfolioStateType? type,
    String? message,
  }) {
    return PortfolioState(
      watchList: watchList ?? this.watchList,
      type: type ?? this.type,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [type, watchList, message];
}

enum PortfolioStateType {
  idle,
  loading,
  success,
  error,
  watchListItemRemoved,
  watchListItemAdded,
}
