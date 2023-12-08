import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data.dart';

part 'portfolio_state.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  final PortfolioRepository _repo;
  PortfolioCubit(this._repo) : super(const PortfolioState()) {
    loadWatchList();
  }

  Future<void> loadWatchList() async {
    try {
      emit(state.copyWith(type: PortfolioStateType.loading));
      final res = await _repo.getWatchList();
      emit(state.copyWith(
        watchList: res,
        type: PortfolioStateType.idle,
      ));
    } catch (e) {
      emit(state.copyWith(
        type: PortfolioStateType.error,
        message: e.toString(),
      ));
    }
  }

  void addToWatchList(Coin coin) {
    final newList = [coin, ...state.watchList];
    _repo.updateWatchList(newList);
    emit(state.copyWith(
      watchList: newList,
      type: PortfolioStateType.watchListItemAdded,
    ));
  }

  void removeFromWatchList(int index) {
    final newList = [...state.watchList]..removeAt(index);
    _repo.updateWatchList(newList);
    emit(state.copyWith(
      watchList: newList,
      type: PortfolioStateType.watchListItemRemoved,
    ));
  }
}
