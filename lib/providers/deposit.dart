// import 'package:bpro_app_wallet/View/BPro_App_Wallet/dashboard.dart';
// import 'package:bpro_app_wallet/models/deposit_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import '../View/BPro_App_Wallet/bpro_app_wallet_main.dart';
// import '../View/BPro_App_Wallet/deposit.dart';
// import 'deposit.dart';
//
// class DepositProvider with ChangeNotifier {
//   bool _isLoading = false;
//
//   bool get isLoading => _isLoading;
//
//   Future<void> addDeposit(DepositModel deposit, BuildContext context) async {
//     print(
//         "Deposit Data ${deposit.amount} and ${deposit.userId} and ${deposit.paymentType},asd ${deposit.typeOfAmount} and ${deposit.image}");
//     _isLoading = true;
//     notifyListeners();
//
//     if (deposit.userId != null) {
//       await FirebaseFirestore.instance.collection('deposits').add(deposit.toMap());
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
//     }
//
//     _isLoading = false;
//     notifyListeners();
//   }
// }

import 'dart:io';
import 'package:bpro_app_wallet/models/deposit_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../View/BPro_App_Wallet/bpro_app_wallet_main.dart';

class DepositProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> addDeposit(DepositModel deposit, BuildContext context) async {
    if (kDebugMode) {
      print(
          "Deposit Data ${deposit.amount}  name ${deposit.username} and ${deposit.userId} and ${deposit.paymentType},asd ${deposit.typeOfAmount} and ${deposit.image}");
    }
    _isLoading = true;
    notifyListeners();

    if (deposit.userId != null) {
      try {
        if (deposit.image != null && deposit.image.isNotEmpty) {
          File imageFile = File(deposit.image);
          String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
          Reference storageRef = FirebaseStorage.instance.ref().child('deposit_images').child(fileName);

          UploadTask uploadTask = storageRef.putFile(imageFile);
          TaskSnapshot storageSnapshot = await uploadTask.whenComplete(() => null);
          String downloadUrl = await storageSnapshot.ref.getDownloadURL();
          deposit.image = downloadUrl;
        }
        await FirebaseFirestore.instance.collection('deposits').add(deposit.toMap());
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BProWalletMain()));
      } catch (e) {
        if (kDebugMode) {
          print('Error adding deposit: $e');
        }
      }
    }
    _isLoading = false;
    notifyListeners();
  }
}
