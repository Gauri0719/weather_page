import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService{
  final _connectivity=Connectivity();
  Future<bool> checkInternetConnection() async {
    final connectivityResult= await _connectivity.checkConnectivity();
    return !connectivityResult.contains(ConnectivityResult.none);
  }
}