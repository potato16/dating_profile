import 'package:rxdart/rxdart.dart';

class GlobalBloc {
  ///
  /// Singleton factory
  ///
  factory GlobalBloc() {
    return _bloc;
  }
  GlobalBloc._internal();
  static final GlobalBloc _bloc = GlobalBloc._internal();

  ///
  /// Streams related to this BLoC
  ///
  final BehaviorSubject<String> _controller = BehaviorSubject<String>();
  Function(String) get push => _controller.sink.add;
  Stream<String> get stream => _controller;

  ///
  /// Resource disposal
  ///
  void dispose() {
    _controller?.close();
  }
}

GlobalBloc globalBloc = GlobalBloc();
