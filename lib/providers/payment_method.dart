// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../models/account_model.dart';
//
// class AccountProvider with ChangeNotifier {
//   List<Account> _accounts = [];
//   String? _selectedAccountId;
//
//   List<Account> get accounts => _accounts;
//   String? get selectedAccountId => _selectedAccountId;
//
//   AccountProvider() {
//     fetchAccounts();
//   }
//
//   Future<void> fetchAccounts() async {
//     final snapshot = await FirebaseFirestore.instance.collection('accountType').get();
//     _accounts = snapshot.docs.map((doc) => Account.fromFirestore(doc.data())).toList();
//     notifyListeners();
//   }
//
//   void selectAccount(String id) {
//     _selectedAccountId = id;
//     notifyListeners();
//   }
// }



import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/account_model.dart';

class AccountProvider with ChangeNotifier {
  List<Account> _accounts = [];
  String? _selectedAccountId;

  List<Account> get accounts => _accounts;
  String? get selectedAccountId => _selectedAccountId;

  AccountProvider() {
    fetchAccounts();
  }

  Future<void> fetchAccounts() async {
    final snapshot = await FirebaseFirestore.instance.collection('accountType')
        .where('accountStatus', isEqualTo: true)
        .get();

    _accounts = snapshot.docs.map((doc) => Account.fromFirestore(doc.data())).toList();
    notifyListeners();
  }

  void selectAccount(String id) {
    _selectedAccountId = id;
    notifyListeners();
  }
}
