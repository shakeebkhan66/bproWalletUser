import 'package:bpro_app_wallet/sharedpreference/sharedpref_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/transfer_model.dart';

class TransferService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? _userId;

  TransferService() {
    _userId = MySharedPrefClass.preferences!.getString("userID");
  }

  void updateUserId(String? userId) {
    print("nnnnnnnnn $userId");
    _userId = userId;
  }

  String? get userId => _userId;

  Stream<List<TransferModel>> getTransferStream() {
    print("sssssssssssssssssss");
    print("uuuuuuuuuuuserId $_userId");
    if (_userId == null) {
      return const Stream.empty();
    }

    return _firestore
        .collection('transferAccount')
        .where('userId', isEqualTo: _userId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
      final data = doc.data();
      return TransferModel.fromJson(data).copyWith(id: doc.id);
    }).toList());
  }

  Future<void> addTransfer(TransferModel transfer) async {
    await _firestore.collection('transferAccount').doc(transfer.id).set(transfer.toJson());
  }

  Future<void> updateTransferStatus(String id, String status) async {
    final docRef = _firestore.collection('transferAccount').doc(id);
    final doc = await docRef.get();

    if (doc.exists) {
      final data = doc.data()!;
      final amount = data['amount'] as num;
      final accountTransferMethod = data['accountTransferMethod'] as String;

      if (status == 'approved') {
        await _updateUserBalance(accountTransferMethod, amount);
      }

      await docRef.update({'status': status});
    }
  }

  Future<void> _updateUserBalance(String method, num amount) async {
    final userDocRef = _firestore.collection('users').doc(_userId);
    final userDoc = await userDocRef.get();

    if (userDoc.exists) {
      final data = userDoc.data()!;
      final totalBalance = data['totalBalance'] as num;

      if (method == 'Wallet to BPro Account') {
        await userDocRef.update({'totalBalance': totalBalance - amount});
      } else if (method == 'BPro Account to Wallet') {
        await userDocRef.update({'totalBalance': totalBalance + amount});
      }
    }
  }

  Future<void> deleteTransfer(String transferID) async {
    await _firestore.collection('transferAccount').doc(transferID).delete();
  }
}
