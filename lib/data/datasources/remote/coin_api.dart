import 'package:crypto_app/core/cores.dart';
import 'package:crypto_app/core/services/web_socket_service.dart';

class CoinApi {
  final NetworkService _networkService;
  final WebSocketService _socketService;
  CoinApi(this._networkService, this._socketService);
}
