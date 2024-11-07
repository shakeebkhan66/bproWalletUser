// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../models/withdraw_model.dart';
//
// class WithdrawService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   String? _userId;
//
//   WithdrawService() {
//     _userId = FirebaseAuth.instance.currentUser?.uid;
//   }
//
//   void updateUserId(String? userId) {
//     _userId = userId;
//   }
//
//   Stream<List<WithdrawModel>> getWithdrawStream() {
//     if (_userId == null) {
//       return const Stream.empty();
//     }
//
//     return _firestore
//         .collection('withdrawAmount')
//         .where('userId', isEqualTo: _userId)
//         .snapshots()
//         .map((snapshot) => snapshot.docs.map((doc) => WithdrawModel.fromJson(doc.data())).toList());
//   }
//
//   Future<void> addWithdraw(WithdrawModel withdraw) {
//     if (_userId == null) {
//       throw Exception('User ID is not set');
//     }
//
//     return _firestore
//         .collection('withdrawAmount')
//         .add({
//       ...withdraw.toJson(),
//       'userId': _userId,
//     });
//   }
// }



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/withdraw_model.dart';

class WithdrawService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? _userId;

  WithdrawService() {
    _userId = FirebaseAuth.instance.currentUser?.uid;
  }

  void updateUserId(String? userId) {
    _userId = userId;
  }

  Stream<List<WithdrawModel>> getWithdrawStream() {
    if (_userId == null) {
      return const Stream.empty();
    }

    return _firestore
        .collection('withdrawAmount')
        .where('userId', isEqualTo: _userId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
      final data = doc.data();
      return WithdrawModel.fromJson(data).copyWith(id: doc.id);
    }).toList());
  }

  Future<void> addWithdraw(WithdrawModel withdraw) {
    if (_userId == null) {
      throw Exception('User ID is not set');
    }

    final withdrawDoc = _firestore.collection('withdrawAmount').doc();
    withdraw.id = withdrawDoc.id;

    return withdrawDoc.set({
      ...withdraw.toJson(),
      'userId': _userId,
    });
  }


  Future<void> deleteWithdraw(String withdrawId) {
    return _firestore.collection('withdrawAmount').doc(withdrawId).delete();
  }

  Future<void> updateWithdraw(String withdrawId, WithdrawModel withdraw) {
    return _firestore.collection('withdrawAmount').doc(withdrawId).update(withdraw.toJson());
  }


}
