import 'package:crypto_app/data/models/coin.dart';

class DummyData {
  static final coins = [
    Coin(
      name: 'Bitcoin',
      code: 'BTC',
      price: 46342.74,
      sign: 1.6,
    ),
    Coin(
      name: 'Ripple',
      code: 'XRP',
      price: 1.1184,
      sign: -0.86,
    ),
    Coin(
      name: 'Litecoin',
      code: 'LTC',
      price: 169.6,
      sign: -1.2,
    ),
    Coin(
      name: 'Solana',
      code: 'SOL',
      price: 119.69,
      sign: -1.6,
    ),
  ];
}
