import 'package:flutter/material.dart';

class CycleBlock {
  int? index;
  String? org;
  String? cycle;
  String? startDate;
  String? endDate;
  String? status;

  CycleBlock({
    this.index,
    this.org,
    this.cycle,
    this.startDate,
    this.endDate,
    this.status,
  });

  Color getStatusColor() {
    switch (status) {
      case 'IN_PROGRESS':
        return Color(0xFFFF7701); // #FF7701
      case 'DONE':
        return Color(0xFF22C55E); // #22C55E
      case 'CANCEL':
        return Color(0xFFDC2529); // #DC2529
      case 'NEW':
        return Color(0xffffbe52);
      default:
        return Colors.grey;
    }
  }

  factory CycleBlock.fromJson(Map<String, dynamic> json) {
    return CycleBlock(
      org: json['org'],
      cycle: json['cycle'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      status: json['status'],
    );
  }
}
//
