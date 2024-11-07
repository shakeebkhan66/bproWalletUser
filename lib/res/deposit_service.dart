import 'package:bpro_app_wallet/sharedpreference/sharedpref_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/deposit_model.dart';

class DepositService {
  final CollectionReference _depositCollection = FirebaseFirestore.instance.collection('deposits');

  String? _currentUserId;

  DepositService() {
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    _currentUserId = MySharedPrefClass.preferences!.getString("userID");
  }

  void updateUserId(String? userId) {
    if (kDebugMode) {
      print("currentId $userId");
    }
    _currentUserId = userId;
  }

  Stream<List<DepositModel>> getDepositStream() async* {
    await _loadUserId();
    if (kDebugMode) {
      print("Current User ID from SharedPreferences: $_currentUserId");
    }

    yield* _depositCollection
        .where('userId', isEqualTo: _currentUserId)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      return query.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return DepositModel(
          userId: data['userId'],
          username: data['username'],
          amount: data['amount'],
          typeOfAmount: data['typeOfAmount'],
          paymentType: data['paymentType'],
          image: data['image'],
          status: data['status'],
          stateOfUser: data['stateOfUser'],
          accountNumber: data['accountNumber'],
          bProAccountUserName: data['bProAccountUserName'],
          bProAccountPassword: data['bProAccountPassword'],
          timestamp: (data['timestamp'] as Timestamp).toDate(),
        );
      }).toList();
    });
  }
}


