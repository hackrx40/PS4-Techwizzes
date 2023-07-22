import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TopDataModel {
  final String name;
  final String price;
  final IconData icon;
  final String perChnage;
  final List<FlSpot> stops;

  TopDataModel({
    required this.name,
    required this.price,
    required this.icon,
    required this.perChnage,
    required this.stops,
  });
}
