import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServicesLocator {
  static ServicesLocator? _instance;
  ServicesLocator._();
  factory ServicesLocator() => _instance ??= ServicesLocator._();

  void init() {
    

  }
}
