import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    print('Bloc: ${bloc.runtimeType}');
    print('Initial State: ${bloc.state}');
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log(change.toString());
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    print('Bloc: ${bloc.runtimeType}');
    print('Final State: ${bloc.state}');
    super.onClose(bloc);
  }
}
