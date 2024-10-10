import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Themecubit extends Cubit<ThemeData> {
  Themecubit() : super(_lightTheme);

  static final _lightTheme = ThemeData.light();
  static final _darkTheme = ThemeData.dark();

  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}
