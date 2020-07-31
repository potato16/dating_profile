import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc_provider.dart';

abstract class BlocEvent extends Object {}

abstract class BlocState extends Object {}

abstract class BlocEventStateBase<BlocEvent, BlocState> implements BlocBase {
  BlocEventStateBase({
    @required this.initialState,
  }) {
    //
    // For each received event, we invoke the [eventHandler] and
    // emit any resulting newState
    //
    _eventController.listen((BlocEvent event) {
      final BlocState currentState = lastState ?? initialState;
      eventHandler(event, currentState).forEach((BlocState newState) {
        _stateController.sink.add(newState);
      });
    });
  }
  final BehaviorSubject<BlocEvent> _eventController =
      BehaviorSubject<BlocEvent>();
  final BehaviorSubject<BlocState> _stateController =
      BehaviorSubject<BlocState>();

  ///
  /// To be invoked to emit an event
  ///
  Function(BlocEvent) get emitEvent => _eventController.sink.add;

  ///
  /// Current/New state
  ///
  Stream<BlocState> get state => _stateController.stream;

  ///
  /// Last State
  ///
  BlocState get lastState => _stateController.value;

  ///
  /// External processing of the event
  ///
  Stream<BlocState> eventHandler(BlocEvent event, BlocState currentState);

  ///
  /// initialState
  ///
  final BlocState initialState;

  @override
  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
