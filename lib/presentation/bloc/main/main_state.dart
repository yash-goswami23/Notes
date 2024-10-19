import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MainState extends Equatable {
  final ThemeMode themeMode;
  final int pageNum;
  const MainState({this.themeMode = ThemeMode.system, this.pageNum = 0});

  MainState copyWith({ThemeMode? themeMode, int? pageNum}) {
    return MainState(
        themeMode: themeMode ?? this.themeMode,
        pageNum: pageNum ?? this.pageNum);
  }

  @override
  List<Object?> get props => [themeMode, pageNum];
}
