import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

enum ConnectionType { wifi, mobile, unknown }

class ConnectionTypeProvider with ChangeNotifier {
  ConnectionType connectionType = ConnectionType.unknown;

  ConnectionTypeProvider() {
    _initConnectivity();
  }

  Future<void> _initConnectivity() async {
    Connectivity connectivity = Connectivity();
    try {
      connectivity.checkConnectivity().then(_updateConnectionType);

      connectivity.onConnectivityChanged.listen(_updateConnectionType);
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  void _updateConnectionType(ConnectivityResult connectivityResult) {
    switch (connectivityResult) {
      case ConnectivityResult.wifi:
        connectionType = ConnectionType.wifi;
        break;

      case ConnectivityResult.mobile:
        connectionType = ConnectionType.mobile;
        break;

      case ConnectivityResult.none:
        connectionType = ConnectionType.unknown;
        break;

      default:
        connectionType = ConnectionType.unknown;
        break;
    }
    notifyListeners();
  }
}
