import 'package:crypto_app/core/constants/storage_keys.dart';
import 'package:crypto_app/core/cores.dart';

import '../../data.dart';

class PortfolioLocalStorage {
  final LocalStorageService _storageService;
  PortfolioLocalStorage(this._storageService);

  void saveWatchList(List<Coin> list) {
    _storageService.saveList(
      StorageKeys.watchList,
      list.map((e) => e.toJson()).toList(),
    );
  }

  List<Coin> getWatchList() {
    final res = _storageService.getList(StorageKeys.watchList);
    if (res == null) return [];
    return res.map((e) => Coin.fromJson(e)).toList();
  }
}
