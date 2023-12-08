import 'package:crypto_app/data/data.dart';

class PortfolioRepository {
  final PortfolioLocalStorage _storage;
  PortfolioRepository(this._storage);
  Future<void> updateWatchList(List<Coin> coins) async {
    _storage.saveWatchList(coins);
  }

  Future<List<Coin>> getWatchList() async {
    await Future.delayed(const Duration(seconds: 3));
    final res = _storage.getWatchList();
    return res;
  }
}
