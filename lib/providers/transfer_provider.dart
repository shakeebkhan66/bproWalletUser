import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bpro_app_wallet/sharedpreference/sharedpref_class.dart';

import '../models/transfer_model.dart';

class TransferProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? _userId;
  List<TransferModel> _transfers = [];
  bool _isLoading = true;

  TransferProvider() {
    _userId = MySharedPrefClass.preferences!.getString("userId");
    _fetchTransfers();
  }

  List<TransferModel> get transfers => _transfers;
  bool get isLoading => _isLoading;

  void updateUserId(String? userId) {
    _userId = userId;
    _fetchTransfers();
  }

  void _fetchTransfers() {
    print("nbeha");
    print("sssssnabhe $_userId");
    _userId = MySharedPrefClass.preferences!.getString("userID");
    print("sssssnabh22e $_userId");
    _firestore
        .collection('transferAccount')
        .where('userId', isEqualTo: _userId)
        .snapshots()
        .listen((snapshot) {
      _transfers = snapshot.docs.map((doc) {
        final data = doc.data();
        print("docID ${doc.id}");
        return TransferModel.fromJson(data).copyWith(id: doc.id);
      }).toList();
      print("transferLIst $_transfers");
      _isLoading = false;
      notifyListeners();
    });
  }
}
