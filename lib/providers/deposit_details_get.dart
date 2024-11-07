// import 'package:bpro_app_wallet/models/transfer_model.dart';
// import 'package:bpro_app_wallet/res/transfer_service.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import '../View/BPro_App_Wallet/bpro_app_wallet_main.dart';
// import '../models/withdraw_model.dart';
// import '../res/deposit_service.dart';
// import '../models/deposit_model.dart';
// import '../res/withdraw_service.dart';
//
// class DepositDetailsProvider with ChangeNotifier {
//   final DepositService _depositService = DepositService();
//   final WithdrawService _withdrawService = WithdrawService();
//   final TransferService _transferService = TransferService();
//   List<DepositModel> _deposits = [];
//   List<WithdrawModel> _withdraws = [];
//   List<TransferModel> _transfers = [];
//   bool _isLoading = true;
//   bool _isAddingWithdraw = false;
//   bool _depositsFetched = false;
//   bool _withdrawsFetched = false;
//   bool _isAddingTransfer = false;
//   bool _transfersFetched = false;
//
//   List<DepositModel> get deposits => _deposits;
//
//   List<WithdrawModel> get withdraws => _withdraws;
//
//   bool get isLoading => _isLoading;
//
//   bool get isAddingWithdraw => _isAddingWithdraw;
//
//   bool get isAddingTransfer => _isAddingTransfer;
//
//   DepositDetailsProvider() {
//     _fetchData();
//   }
//
//   void _fetchData() {
//     _isLoading = true;
//     notifyListeners();
//     _fetchDeposits();
//     _fetchWithdraws();
//     _fetchTransfer();
//   }
//
//   void _fetchDeposits() {
//     _depositService.getDepositStream().listen((List<DepositModel> depositList) {
//       _deposits = depositList;
//       _depositsFetched = true;
//       _checkLoadingStatus();
//     });
//   }
//
//   void _fetchWithdraws() {
//     _withdrawService.getWithdrawStream().listen((List<WithdrawModel> withdrawList) {
//       _withdraws = withdrawList;
//       _withdrawsFetched = true;
//       _checkLoadingStatus();
//     });
//   }
//
//   void _fetchTransfer() {
//     _transferService.getTransferStream().listen((List<TransferModel> transferList) {
//       _transfers = transferList;
//       _transfersFetched = true;
//       _checkLoadingStatus();
//     });
//   }
//
//   void _checkLoadingStatus() {
//     if (_depositsFetched && _withdrawsFetched && _transfersFetched) {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
//
//   void updateUserId(String? userId) {
//     print("kashi $userId");
//     _depositService.updateUserId(userId);
//     _withdrawService.updateUserId(userId);
//     _transferService.updateUserId(userId);
//     _fetchData();
//   }
//
//   bool get canAddDeposit {
//     if (_deposits.isEmpty) return true;
//     final latestStatus = _deposits.first.status;
//     return latestStatus == 'Approved' || latestStatus == 'Rejected';
//   }
//
//   double get totalApprovedDeposit {
//     return _deposits.where((deposit) => deposit.status == 'Approved').fold(0.0, (sum, deposit) => sum + deposit.amount);
//   }
//
//   double get totalWithdrawnAmount {
//     return _withdraws
//         .where((withdraws) => withdraws.status == 'Approved')
//         .fold(0.0, (sum, withdraw) => sum + withdraw.amount);
//   }
//
//   double get totalTransferAmount {
//     return _transfers.where((transfers) => transfers.status == 'Approved').fold(
//         0.0,
//         (sum, transfer) =>
//             transfer.accountTransferMethod == 'Wallet to BPro Account' ? sum + transfer.amount : sum - transfer.amount);
//   }
//
//   double get availableBalance {
//     return totalApprovedDeposit - totalWithdrawnAmount;
//   }
//
//   void withdrawAmount({
//     required double amount,
//     required String accountType,
//     required String accountNo,
//     required String accountTitle,
//     required String status,
//     required DateTime date,
//     required BuildContext context,
//   }) {
//     if (amount < 1000) {
//       Fluttertoast.showToast(msg: "Please add withdraw amount at least 1000 or more.");
//       return;
//     }
//
//     if (amount > availableBalance) {
//       Fluttertoast.showToast(msg: "You are exceeding from total deposit amount.");
//       return;
//     }
//
//     _isAddingWithdraw = true;
//     notifyListeners();
//
//     final newWithdraw = WithdrawModel(
//         amount: amount,
//         accountType: accountType,
//         accountNo: accountNo,
//         status: 'pending',
//         accountTitle: accountTitle,
//         timestamp: date);
//
//     _withdrawService.addWithdraw(newWithdraw).then((_) {
//       _isAddingWithdraw = false;
//       _fetchWithdraws();
//       notifyListeners();
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BProWalletMain()));
//     }).catchError((error) {
//       _isAddingWithdraw = false;
//       Fluttertoast.showToast(msg: "Failed to withdraw amount: $error");
//       notifyListeners();
//     });
//   }
//
//   deleteWithDraw(String withdrawID) {
//     _withdrawService.deleteWithdraw(withdrawID);
//   }
//
//   updateWithDraw(String withdrawID, WithdrawModel withdrawModel) {
//     _withdrawService.updateWithdraw(withdrawID, withdrawModel);
//   }
//
// }







// import 'package:flutter/material.dart';
// import '../res/deposit_service.dart';
// import '../models/deposit_model.dart';
//
// class DepositDetailsProvider with ChangeNotifier {
//   final DepositService _depositService = DepositService();
//   List<DepositModel> _deposits = [];
//   bool _isLoading = true;
//
//   List<DepositModel> get deposits => _deposits;
//   bool get isLoading => _isLoading;
//
//   DepositDetailsProvider(){
//     _fetchDeposits();
//   }
//
//   void _fetchDeposits() {
//     _isLoading = true;
//     notifyListeners();
//
//     _depositService.getDepositStream().listen((List<DepositModel> depositList) {
//       _deposits = depositList;
//       _isLoading = false;
//       notifyListeners();
//     });
//   }
//
//   void updateUserId(String? userId) {
//     _depositService.updateUserId(userId);
//     _fetchDeposits();
//   }
//
//   bool get canAddDeposit {
//     if (_deposits.isEmpty) return true;
//     final latestStatus = _deposits.first.status;
//     return latestStatus == 'Approved' || latestStatus == 'Rejected';
//   }
//
//   double get totalApprovedDeposit {
//     return _deposits
//         .where((deposit) => deposit.status == 'Approved')
//         .fold(0.0, (sum, deposit) => sum + deposit.amount);
//   }
// }


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// import '../View/BPro_App_Wallet/bpro_app_wallet_main.dart';
// import '../View/BPro_App_Wallet/transfer.dart';
// import '../models/deposit_model.dart';
// import '../models/transfer_model.dart';
// import '../models/withdraw_model.dart';
// import '../res/deposit_service.dart';
// import '../res/transfer_service.dart';
// import '../res/withdraw_service.dart';
// import 'package:uuid/uuid.dart';
//
//
// class DepositDetailsProvider with ChangeNotifier {
//   final DepositService _depositService = DepositService();
//   final WithdrawService _withdrawService = WithdrawService();
//   final TransferService _transferService = TransferService();
//
//   List<DepositModel> _deposits = [];
//   List<WithdrawModel> _withdraws = [];
//   List<TransferModel> _transfers = [];
//
//   bool _isLoading = true;
//   bool _isAddingWithdraw = false;
//   bool _depositsFetched = false;
//   bool _withdrawsFetched = false;
//   bool _isAddingTransfer = false;
//   bool _transfersFetched = false;
//   bool _isTransferring = false;
//
//
//   List<DepositModel> get deposits => _deposits;
//
//   List<WithdrawModel> get withdraws => _withdraws;
//
//   List<TransferModel> get transfers => _transfers;
//
//   bool get isLoading => _isLoading;
//
//   bool get isAddingWithdraw => _isAddingWithdraw;
//
//   bool get isAddingTransfer => _isAddingTransfer;
//
//   bool get isTransferring => _isTransferring;
//
//   DepositDetailsProvider() {
//     _fetchData();
//   }
//
//   void _fetchData() {
//     _isLoading = true;
//     _fetchDeposits();
//     _fetchWithdraws();
//     _fetchTransfers();
//     notifyListeners();
//   }
//
//   void _fetchDeposits() {
//     _depositService.getDepositStream().listen((List<DepositModel> depositList) {
//       _deposits = depositList;
//       _depositsFetched = true;
//       _checkLoadingStatus();
//     });
//   }
//
//   void _fetchWithdraws() {
//     _withdrawService.getWithdrawStream().listen((List<WithdrawModel> withdrawList) {
//       _withdraws = withdrawList;
//       _withdrawsFetched = true;
//       _checkLoadingStatus();
//     });
//   }
//
//   void _fetchTransfers() {
//     print("TransferAmount");
//     _transferService.getTransferStream().listen((List<TransferModel> transferList) {
//       _transfers = transferList;
//       _transfersFetched = true;
//       _checkLoadingStatus();
//     });
//   }
//
//   void _checkLoadingStatus() {
//     if (_depositsFetched && _withdrawsFetched) {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
//
//   void updateUserId(String? userId) {
//     print("abakUserid $userId");
//     _depositService.updateUserId(userId);
//     _withdrawService.updateUserId(userId);
//     _transferService.updateUserId(userId);
//     _fetchData();
//   }
//
//   bool get canAddDeposit {
//     if (_deposits.isEmpty) return true;
//     final latestStatus = _deposits.first.status;
//     return latestStatus == 'Approved' || latestStatus == 'Rejected';
//   }
//
//   double get totalApprovedDeposit {
//     return _deposits.where((deposit) => deposit.status == 'Approved').fold(0.0, (sum, deposit) => sum + deposit.amount);
//   }
//
//   double get totalWithdrawnAmount {
//     return _withdraws
//         .where((withdraw) => withdraw.status == 'Approved')
//         .fold(0.0, (sum, withdraw) => sum + withdraw.amount);
//   }
//
//   double get totalTransferAmount {
//     return _transfers.where((transfer) => transfer.status == 'Approved').fold(
//         0.0,
//             (sum, transfer) =>
//         transfer.accountTransferMethod == 'Wallet to BPro Account' ? sum + transfer.amount : sum - transfer.amount);
//   }
//
//   double get availableBalance {
//     return totalApprovedDeposit - totalWithdrawnAmount;
//   }
//
//   void withdrawAmount({
//     required double amount,
//     required String accountType,
//     required String accountNo,
//     required String accountTitle,
//     required String status,
//     required DateTime date,
//     required BuildContext context,
//   }) {
//     if (amount < 1000) {
//       Fluttertoast.showToast(msg: "Please add withdraw amount at least 1000 or more.");
//       return;
//     }
//
//     if (amount > availableBalance) {
//       Fluttertoast.showToast(msg: "You are exceeding from total deposit amount.");
//       return;
//     }
//
//     _isAddingWithdraw = true;
//     notifyListeners();
//
//     final newWithdraw = WithdrawModel(
//         amount: amount,
//         accountType: accountType,
//         accountNo: accountNo,
//         status: 'pending',
//         accountTitle: accountTitle,
//         timestamp: date);
//
//     _withdrawService.addWithdraw(newWithdraw).then((_) {
//       _isAddingWithdraw = false;
//       _fetchWithdraws();
//       notifyListeners();
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BProWalletMain()));
//     }).catchError((error) {
//       _isAddingWithdraw = false;
//       Fluttertoast.showToast(msg: "Failed to withdraw amount: $error");
//       notifyListeners();
//     });
//   }
//
//   void deleteWithdraw(String withdrawID) {
//     _withdrawService.deleteWithdraw(withdrawID);
//   }
//
//   void updateWithdraw(String withdrawID, WithdrawModel withdrawModel) {
//     _withdrawService.updateWithdraw(withdrawID, withdrawModel);
//   }
//
//
//   void transferAmount({
//     required double amount,
//     required String changeTransfer,
//     required String userId,
//     required String status,
//     required BuildContext context,
//   }) {
//     if (amount < 1000) {
//       Fluttertoast.showToast(msg: "Please add transfer amount at least 1000 or more.");
//       return;
//     }
//
//     DateTime now = DateTime.now();
//     Timestamp timestamp = Timestamp.fromDate(now);
//
//     double availableBalance = totalApprovedDeposit - totalWithdrawnAmount;
//
//     if (amount > availableBalance) {
//       Fluttertoast.showToast(msg: "You are exceeding from total deposit amount.");
//       return;
//     }
//
//     final userDeposit = _deposits.firstWhere((deposit) => deposit.userId == userId,);
//     if (userDeposit == null || userDeposit.stateOfUser != 'active') {
//       Fluttertoast.showToast(msg: "User is not activated. Transfer is not allowed.");
//       return;
//     }
//
//     _isTransferring = true;
//     notifyListeners();
//
//     final newTransfer = TransferModel(
//       id: const Uuid().v4(),
//       amount: amount,
//       userId: userId,
//       status: status,
//       accountTransferMethod: changeTransfer,
//       timestamp: timestamp,
//     );
//
//     _isAddingTransfer = true;
//     notifyListeners();
//
//     _transferService.addTransfer(newTransfer).then((_) {
//       _isTransferring = false;
//       _isAddingTransfer = false;
//       _fetchTransfers();
//       notifyListeners();
//       Navigator.push(context, MaterialPageRoute(builder: (context) => const BProWalletMain()));
//     }).catchError((error) {
//       _isAddingTransfer = false;
//       _isTransferring = false;
//       Fluttertoast.showToast(msg: "Failed to transfer amount: $error");
//       notifyListeners();
//     });
//   }
// }




import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../View/BPro_App_Wallet/bpro_app_wallet_main.dart';
import '../models/deposit_model.dart';
import '../models/withdraw_model.dart';
import '../models/transfer_model.dart';
import '../res/deposit_service.dart';
import '../res/transfer_service.dart';
import '../res/withdraw_service.dart';


class DepositDetailsProvider with ChangeNotifier {
  final DepositService _depositService = DepositService();
  final WithdrawService _withdrawService = WithdrawService();
  final TransferService _transferService = TransferService();

  List<DepositModel> _deposits = [];
  List<WithdrawModel> _withdraws = [];
  List<TransferModel> _transfers = [];

  bool _isLoading = true;
  bool _isAddingWithdraw = false;
  bool _depositsFetched = false;
  bool _withdrawsFetched = false;
  bool _isAddingTransfer = false;
  bool _transfersFetched = false;
  bool _isTransferring = false;

  List<DepositModel> get deposits => _deposits;
  List<WithdrawModel> get withdraws => _withdraws;
  List<TransferModel> get transfers => _transfers;
  bool get isLoading => _isLoading;
  bool get isAddingWithdraw => _isAddingWithdraw;
  bool get isAddingTransfer => _isAddingTransfer;
  bool get isTransferring => _isTransferring;

  DepositDetailsProvider() {
    _fetchData();
  }

  void _fetchData() {
    _isLoading = true;
    _fetchDeposits();
    _fetchWithdraws();
    _fetchTransfers();
    notifyListeners();
  }

  void _fetchDeposits() {
    _depositService.getDepositStream().listen((List<DepositModel> depositList) {
      _deposits = depositList;
      _depositsFetched = true;
      _checkLoadingStatus();
    });
  }

  void _fetchWithdraws() {
    _withdrawService.getWithdrawStream().listen((List<WithdrawModel> withdrawList) {
      _withdraws = withdrawList;
      _withdrawsFetched = true;
      _checkLoadingStatus();
    });
  }

  void _fetchTransfers() {
    _transferService.getTransferStream().listen((List<TransferModel> transferList) {
      _transfers = transferList;
      _transfersFetched = true;
      _checkLoadingStatus();
    });
  }

  void _checkLoadingStatus() {
    if (_depositsFetched && _withdrawsFetched && _transfersFetched) {
      _isLoading = false;
      notifyListeners();
    }
  }

  void updateUserId(String? userId) {
    _depositService.updateUserId(userId);
    _withdrawService.updateUserId(userId);
    _transferService.updateUserId(userId);
    _fetchData();
  }

  bool get canAddDeposit {
    if (_deposits.isEmpty) return true;
    final latestStatus = _deposits.first.status;
    return latestStatus == 'Approved' || latestStatus == 'Rejected';
  }

  double get totalApprovedDeposit {
    double totalDeposit = _deposits.where((deposit) => deposit.status == 'Approved').fold(0.0, (sum, deposit) => sum + deposit.amount);

    for (var transfer in _transfers) {
      if (transfer.status == 'accepted') {
        if (transfer.accountTransferMethod == 'Wallet to BPro Account') {
          totalDeposit -= transfer.amount;
        } else if (transfer.accountTransferMethod == 'BPro Account to Wallet') {
          totalDeposit += transfer.amount;
        }
      }
    }

    return totalDeposit;
  }

  double get totalWithdrawnAmount {
    return _withdraws
        .where((withdraw) => withdraw.status == 'Approved')
        .fold(0.0, (sum, withdraw) => sum + withdraw.amount);
  }

  double get availableBalance {
    return totalApprovedDeposit - totalWithdrawnAmount;
  }

  void withdrawAmount({
    required double amount,
    required String accountType,
    required String accountNo,
    required String accountTitle,
    required String status,
    required DateTime date,
    required BuildContext context,
  }) {
    if (amount < 1000) {
      Fluttertoast.showToast(msg: "Please add withdraw amount at least 1000 or more.");
      return;
    }

    if (amount > availableBalance) {
      Fluttertoast.showToast(msg: "You are exceeding from total deposit amount.");
      return;
    }

    _isAddingWithdraw = true;
    notifyListeners();

    final newWithdraw = WithdrawModel(
        amount: amount,
        accountType: accountType,
        accountNo: accountNo,
        status: 'pending',
        accountTitle: accountTitle,
        timestamp: date);

    _withdrawService.addWithdraw(newWithdraw).then((_) {
      _isAddingWithdraw = false;
      _fetchWithdraws();
      notifyListeners();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BProWalletMain()));
    }).catchError((error) {
      _isAddingWithdraw = false;
      Fluttertoast.showToast(msg: "Failed to withdraw amount: $error");
      notifyListeners();
    });
  }

  void deleteWithdraw(String withdrawID) {
    _withdrawService.deleteWithdraw(withdrawID);
  }

  void updateWithdraw(String withdrawID, WithdrawModel withdrawModel) {
    _withdrawService.updateWithdraw(withdrawID, withdrawModel);
  }

  void transferAmount({
    required double amount,
    required String changeTransfer,
    required String userId,
    required String status,
    required BuildContext context,
  }) {
    if (amount < 1000) {
      Fluttertoast.showToast(msg: "Please add transfer amount at least 1000 or more.");
      return;
    }

    DateTime now = DateTime.now();
    Timestamp timestamp = Timestamp.fromDate(now);

    double availableBalance = totalApprovedDeposit - totalWithdrawnAmount;

    if (amount > availableBalance) {
      Fluttertoast.showToast(msg: "You are exceeding from total deposit amount.");
      return;
    }

    final userDeposit = _deposits.firstWhere((deposit) => deposit.userId == userId);
    if (userDeposit == null || userDeposit.stateOfUser != 'active') {
      Fluttertoast.showToast(msg: "User is not activated. Transfer is not allowed.");
      return;
    }

    _isTransferring = true;
    notifyListeners();

    final newTransfer = TransferModel(
      id: const Uuid().v4(),
      amount: amount,
      userId: userId,
      status: status,
      accountTransferMethod: changeTransfer,
      timestamp: timestamp,
    );

    _isAddingTransfer = true;
    notifyListeners();

    _transferService.addTransfer(newTransfer).then((_) {
      _isTransferring = false;
      _isAddingTransfer = false;
      _fetchTransfers();
      notifyListeners();
      Navigator.push(context, MaterialPageRoute(builder: (context) => const BProWalletMain()));
    }).catchError((error) {
      _isAddingTransfer = false;
      _isTransferring = false;
      Fluttertoast.showToast(msg: "Failed to transfer amount: $error");
      notifyListeners();
    });
  }
}





















// void transferAmount({
  //   required double amount,
  //   required String changeTransfer,
  //   required String userId,
  //   required String status,
  //   required BuildContext context,
  // }) {
  //   if (amount < 1000) {
  //     Fluttertoast.showToast(msg: "Please add transfer amount at least 1000 or more.");
  //     return;
  //   }
  //
  //   DateTime now = DateTime.now();
  //   Timestamp timestamp = Timestamp.fromDate(now);
  //
  //   double availableBalance = totalApprovedDeposit - totalWithdrawnAmount;
  //
  //   if (amount > availableBalance) {
  //     Fluttertoast.showToast(msg: "You are exceeding from total deposit amount.");
  //     return;
  //   }
  //
  //   _isTransferring = true;
  //   notifyListeners();
  //
  //   final newTransfer = TransferModel(
  //     amount: amount,
  //     userId: userId,
  //     status: status,
  //     accountTransferMethod: changeTransfer,
  //     timestamp: timestamp,
  //   );
  //
  //   _isAddingTransfer = true;
  //   notifyListeners();
  //
  //   _transferService.addTransfer(newTransfer).then((_) {
  //     _isTransferring = false;
  //     _isAddingTransfer = false;
  //     _fetchTransfers();
  //     notifyListeners();
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => const BProWalletMain()));
  //   }).catchError((error) {
  //     _isAddingTransfer = false;
  //     _isTransferring = false;
  //     Fluttertoast.showToast(msg: "Failed to transfer amount: $error");
  //     notifyListeners();
  //   });
  // }




  // void updateTransferStatus(String id, String status) {
  //   _transferService.updateTransferStatus(id, status).then((_) {
  //     _fetchTransfers();
  //     notifyListeners();
  //   }).catchError((error) {
  //     Fluttertoast.showToast(msg: "Failed to update transfer status: $error");
  //   });
  // }
  //
  // void deleteTransfer(String transferID) {
  //   _transferService.deleteTransfer(transferID).then((_) {
  //     _fetchTransfers();
  //     notifyListeners();
  //   }).catchError((error) {
  //     Fluttertoast.showToast(msg: "Failed to delete transfer: $error");
  //   });
  // }



