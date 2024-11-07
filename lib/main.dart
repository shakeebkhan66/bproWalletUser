// import 'package:bpro_app_wallet/View/BPro_App_Wallet/bpro_app_wallet_main.dart';
// import 'package:bpro_app_wallet/providers/auth_register.dart';
// import 'package:bpro_app_wallet/providers/deposit.dart';
// import 'package:bpro_app_wallet/providers/deposit_details_get.dart';
// import 'package:bpro_app_wallet/sharedpreference/sharedpref_class.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'View/onboarding/onbording.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   MySharedPrefClass.preferences = await SharedPreferences.getInstance();
//   await Firebase.initializeApp(
//     options: const FirebaseOptions(
//       apiKey: 'AIzaSyBadv6c0PmBUoIlR7-Z4UeviHxdioFmnCo',
//       appId: '1:1012997214299:android:e257ec6672e24fa66aaf7e',
//       messagingSenderId: '1012997214299',
//       projectId: 'bpro-f4ef0',
//       storageBucket: 'bpro-f4ef0.appspot.com',
//     ),
//   );
//   runApp(
//     const MyApp(),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   Future<bool> _checkLoginStatus() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.containsKey('userId');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => DepositProvider()),
//         ChangeNotifierProvider(create: (_) => DepositDetailsProvider()),
//         ChangeNotifierProxyProvider<DepositDetailsProvider, AuthRegister>(
//           create: (_) => AuthRegister(),
//           update: (_, depositProvider, authRegister) {
//             authRegister?.setDepositDetailsProvider(depositProvider);
//             return authRegister!;
//           },
//         ),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: MySharedPrefClass.preferences?.getBool("loggedIn") == true
//             ? const BProWalletMain()
//             : Onbording(),
//       ),
//     );
//   }
// }


import 'package:bpro_app_wallet/View/BPro_App_Wallet/bpro_app_wallet_main.dart';
import 'package:bpro_app_wallet/providers/auth_register.dart';
import 'package:bpro_app_wallet/providers/deposit.dart';
import 'package:bpro_app_wallet/providers/deposit_details_get.dart';
import 'package:bpro_app_wallet/providers/transfer_provider.dart';
import 'package:bpro_app_wallet/sharedpreference/sharedpref_class.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'View/onboarding/onbording.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MySharedPrefClass.preferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBadv6c0PmBUoIlR7-Z4UeviHxdioFmnCo',
      appId: '1:1012997214299:android:e257ec6672e24fa66aaf7e',
      messagingSenderId: '1012997214299',
      projectId: 'bpro-f4ef0',
      storageBucket: 'bpro-f4ef0.appspot.com',
    ),
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  bool _checkLoginStatus() {
    return MySharedPrefClass.preferences?.getBool('loggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DepositProvider()),
        ChangeNotifierProvider(create: (_) => DepositDetailsProvider()),
        ChangeNotifierProvider(create: (_) => TransferProvider()),
        ChangeNotifierProxyProvider<DepositDetailsProvider, AuthRegister>(
          create: (_) => AuthRegister(),
          update: (_, depositProvider, authRegister) {
            authRegister?.setDepositDetailsProvider(depositProvider);
            return authRegister!;
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: _checkLoginStatus()
            ? const BProWalletMain()
            : Onbording(),
      ),
    );
  }
}
