// import 'package:bpro_app_wallet/providers/deposit_details_get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class AuthRegister with ChangeNotifier {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   DepositDetailsProvider depositDetailsProvider = DepositDetailsProvider();
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   Future<User?> registerWithEmailAndPassword(String email, String password, String name) async {
//     try {
//       UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
//       User? user = result.user;
//       if (user != null) {
//         await sendEmailVerification(user);
//         await _addUserToFirestore(user, name);
//       }
//       return user;
//     } catch (error) {
//       rethrow;
//     }
//   }
//
//   Future<void> sendEmailVerification(User user) async {
//     await user.sendEmailVerification();
//   }
//
//   Future<void> _addUserToFirestore(User user, String name) async {
//     await _firestore.collection('registeredUser').doc(user.uid).set({
//       'email': user.email,
//       'name': name,
//       'uid': FirebaseAuth.instance.currentUser!.uid,
//     });
//   }
//
//   Future<User?> loginWithEmailAndPassword(String email, String password) async {
//     try {
//       UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
//       User? user = result.user;
//       if (user != null && user.emailVerified) {
//         await _saveUserDetails(user);
//         depositDetailsProvider.updateUserId(user.uid);
//       }
//       return user;
//     } catch (error) {
//       rethrow;
//     }
//   }
//
//   Future<void> _saveUserDetails(User user) async {
//     print("heeeeeeeeeeeeelo");
//     print("heeeeeeeeeeeeelo  ${user.uid}");
//
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('userId', user.uid);
//     await prefs.setString('userEmail', user.email!);
//     depositDetailsProvider.updateUserId(user.uid);
//     notifyListeners();
//   }
//
//   Future<void> logout() async {
//     try {
//       await _auth.signOut();
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.clear();
//       depositDetailsProvider.updateUserId(null);
//
//       notifyListeners();
//     } catch (e) {
//       print("Logout failed: $e");
//       rethrow;
//     }
//   }
//
//   Future<void> registerWithPhoneNumber(String phoneNumber, String password, String name, String whatsappNumber) async {
//     try {
//       QuerySnapshot querySnapshot = await _firestore.collection('registeredUser')
//           .where('phoneNumber', isEqualTo: phoneNumber).get();
//
//       if (querySnapshot.docs.isNotEmpty) {
//         throw Exception("This phone number is already registered.");
//       }
//       UserCredential result = await _auth.createUserWithEmailAndPassword(email: "$phoneNumber@dummy.com", password: password);
//       User? user = result.user;
//       if (user != null) {
//         await _addNumberUserToFirestore(user, phoneNumber, name, whatsappNumber);
//       }
//     } catch (error) {
//       rethrow;
//     }
//   }
//
//   Future<void> _addNumberUserToFirestore(User user, String phoneNumber, String name, String whatsApp) async {
//     await _firestore.collection('registeredUser').doc(user.uid).set({
//       'phoneNumber': phoneNumber,
//       'name': name,
//       'whatsappNumber': whatsApp,
//       'uid': FirebaseAuth.instance.currentUser!.uid
//     });
//   }
//
//   Future<User?> loginWithPhoneNumber(String phoneNumber, String password) async {
//     try {
//       UserCredential result = await _auth.signInWithEmailAndPassword(email: "$phoneNumber@dummy.com", password: password);
//       User? user = result.user;
//       if (user != null) {
//         await _saveUserDetails(user);
//         depositDetailsProvider.updateUserId(user.uid);
//       }
//       return user;
//     } catch (error) {
//       rethrow;
//     }
//   }
// }


import 'package:bpro_app_wallet/View/BPro_App_Wallet/bpro_app_wallet_main.dart';
import 'package:bpro_app_wallet/providers/deposit_details_get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../View/Login_SignUp_Screens/UsingPhone/continue_using_phone_login.dart';
import '../sharedpreference/sharedpref_class.dart';

class AuthRegister with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DepositDetailsProvider? _depositDetailsProvider;

  AuthRegister();

  void setDepositDetailsProvider(DepositDetailsProvider depositDetailsProvider) {
    _depositDetailsProvider = depositDetailsProvider;
  }

  Future<User?> registerWithEmailAndPassword(String email, String password, String name) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      if (user != null) {
        await sendEmailVerification(user);
        await _addUserToFirestore(user, name);
      }
      return user;
    } catch (error) {
      rethrow;
    }
  }

  Future<void> sendEmailVerification(User user) async {
    await user.sendEmailVerification();
  }

  Future<void> _addUserToFirestore(User user, String name) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      await _firestore.collection('registeredUser').doc(user.uid).set({
        'email': user.email,
        'name': name,
        'uid': currentUser.uid,
      });
    } else {
      if (kDebugMode) {
        print("Current user is null while adding user to Firestore");
      }
    }
  }

  Future<User?> loginWithEmailAndPassword(String email, String password, BuildContext context) async {
    if (kDebugMode) {
      print("email $email");
    }
    if (kDebugMode) {
      print("password $password");
    }
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (kDebugMode) {
        print("result $result");
      }
      User? user = result.user;
      if (kDebugMode) {
        print("user $user");
      }
      if (user != null && user.emailVerified) {
        await _saveUserDetails(user, context);
      } else {
        if (kDebugMode) {
          print("User is null or email is not verified");
        }
      }
      return user;
    } catch (error) {
      if (kDebugMode) {
        print("Error is: $error");
      }
      rethrow;
    }
  }

  Future<void> _saveUserDetails(User user, BuildContext context) async {
    if (kDebugMode) {
      print("sssssssssssssssssssssssss $user");
    }
    if (user != null) {
      MySharedPrefClass.preferences!.setBool("loggedIn", true);
       MySharedPrefClass.preferences!.setString('userID', user.uid);
       MySharedPrefClass.preferences!.setString("userEmail", user.email.toString());
      _depositDetailsProvider?.updateUserId(user.uid);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BProWalletMain()));
      notifyListeners();
    } else {
      if (kDebugMode) {
        print("Shared preferences is null");
      }
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
        MySharedPrefClass.preferences!.setBool("loggedIn", false);
        var currentUserID = MySharedPrefClass.preferences!.getString("userID");
        _depositDetailsProvider?.updateUserId(currentUserID);
        notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print("Logout failed: $e");
      }
      rethrow;
    }
  }

  Future<void> registerWithPhoneNumber(String phoneNumber, String password, String name, String whatsappNumber, BuildContext context) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('registeredUser')
          .where('phoneNumber', isEqualTo: phoneNumber).get();

      if (querySnapshot.docs.isNotEmpty) {
        throw Exception("This phone number is already registered.");
      }
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: "$phoneNumber@dummy.com", password: password);
      User? user = result.user;
      if (user != null) {
        await _addNumberUserToFirestore(user, phoneNumber, name, whatsappNumber);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ContinueUsingPhone()),
        );
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> _addNumberUserToFirestore(User user, String phoneNumber, String name, String whatsApp) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      await _firestore.collection('registeredUser').doc(user.uid).set({
        'phoneNumber': phoneNumber,
        'name': name,
        'whatsappNumber': whatsApp,
        'uid': currentUser.uid
      });
    } else {
      if (kDebugMode) {
        print("Current user is null while adding number user to Firestore");
      }
    }
  }

  Future<User?> loginWithPhoneNumber(String phoneNumber, String password, BuildContext context) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: "$phoneNumber@dummy.com", password: password);
      User? user = result.user;
      if (user != null) {
        await _saveUserDetails(user, context);
      }
      return user;
    } catch (error) {
      rethrow;
    }
  }

}


