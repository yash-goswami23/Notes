import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object?> get props => [];
}

class ChangeThemeMode extends MainEvent {
  final ThemeMode themeMode;
  const ChangeThemeMode({required this.themeMode});
}

class ChangeBottomPages extends MainEvent {
  final int pageNum;
  const ChangeBottomPages({required this.pageNum});
}
