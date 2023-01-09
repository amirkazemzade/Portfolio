import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ScreenModel extends Equatable {
  final String name;
  final IconData icon;
  final Widget widget;

  const ScreenModel({
    required this.name,
    required this.icon,
    required this.widget,
  });

  @override
  List<Object> get props => [name, icon, widget];
}
