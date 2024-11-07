import 'package:cloud_firestore/cloud_firestore.dart';

class TransferModel {
  final String? id;
  final String userId;
  final double amount;
  final String status;
  final String accountTransferMethod;
  final Timestamp timestamp;

  TransferModel({
    this.id,
    required this.userId,
    required this.amount,
    required this.status,
    required this.accountTransferMethod,
    required this.timestamp,
  });

  factory TransferModel.fromJson(Map<String, dynamic> json) {
    return TransferModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      amount: (json['amount'] as num).toDouble(),
      status: json['status'] as String,
      accountTransferMethod: json['accountTransferMethod'] as String,
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'amount': amount,
      'status': status,
      'accountTransferMethod': accountTransferMethod,
      'timestamp': timestamp,
    };
  }

  TransferModel copyWith({String? id}) {
    return TransferModel(
      id: id,
      userId: userId,
      amount: amount,
      status: status,
      accountTransferMethod: accountTransferMethod,
      timestamp: timestamp,
    );
  }
}
