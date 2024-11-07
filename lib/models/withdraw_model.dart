import 'package:cloud_firestore/cloud_firestore.dart';

class WithdrawModel {
  String? id;
  final String accountNo;
  final String accountTitle;
  final String accountType;
  final double amount;
  final String status;
  DateTime? timestamp;

  WithdrawModel({
    this.id,
    required this.accountNo,
    required this.accountTitle,
    required this.accountType,
    required this.amount,
    required this.status,
    this.timestamp,
  });

  factory WithdrawModel.fromJson(Map<String, dynamic> json) {
    return WithdrawModel(
      id: json['id'] as String?,
      accountNo: json['accountNo'] as String,
      accountTitle: json['accountTitle'] as String,
      accountType: json['accountType'] as String,
      amount: (json['amount'] as num).toDouble(),
      status: json['status'] as String,
      timestamp: (json['timestamp'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'accountNo': accountNo,
      'accountTitle': accountTitle,
      'accountType': accountType,
      'amount': amount,
      'status': status,
      'timestamp': timestamp != null ? Timestamp.fromDate(timestamp!) : null,
    };
  }

  WithdrawModel copyWith({String? id}) {
    return WithdrawModel(
      id: id ?? this.id,
      accountNo: accountNo,
      accountTitle: accountTitle,
      accountType: accountType,
      amount: amount,
      status: status,
      timestamp: timestamp,
    );
  }
}
