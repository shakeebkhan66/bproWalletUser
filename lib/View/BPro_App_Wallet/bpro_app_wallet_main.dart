// import 'package:bpro_app_wallet/View/BPro_App_Wallet/bpro.dart';
// import 'package:bpro_app_wallet/View/BPro_App_Wallet/dashboard.dart';
// import 'package:bpro_app_wallet/View/BPro_App_Wallet/transfer.dart';
// import 'package:bpro_app_wallet/View/BPro_App_Wallet/withdraw.dart';
// import 'package:flutter/material.dart';
//
// class BProWalletMain extends StatefulWidget {
//   const BProWalletMain({super.key});
//
//   @override
//   _BProWalletMainState createState() => _BProWalletMainState();
// }
//
// class _BProWalletMainState extends State<BProWalletMain> {
//   int _currentIndex = 0;
//
//   final List<Widget> _children = [
//     const Dashboard(),
//     BPro(),
//     Transfer(),
//     Withdraw(),
//   ];
//
//   void onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: _children[_currentIndex],
//         bottomNavigationBar: BottomNavigationBar(
//           onTap: onTabTapped,
//           currentIndex: _currentIndex,
//           backgroundColor: Colors.blue,
//           selectedItemColor: Colors.green,
//           unselectedItemColor: Colors.grey[700],
//           selectedFontSize: 15,
//           unselectedFontSize: 15,
//           showSelectedLabels: true,
//           showUnselectedLabels: true,
//           selectedIconTheme: const IconThemeData(
//             size: 30,
//           ),
//           unselectedIconTheme: const IconThemeData(
//             size: 30,
//           ),
//           selectedLabelStyle: const TextStyle(
//             color: Colors.green,
//             fontFamily: 'Kanit',
//           ),
//           unselectedLabelStyle: const TextStyle(
//             color: Colors.black,
//             fontFamily: 'Kanit',
//           ),
//           items: [
//             BottomNavigationBarItem(
//               backgroundColor: const Color.fromARGB(255, 192, 255, 194),
//               icon: Container(
//                 height: 40,
//                 width: 40,
//                 decoration: BoxDecoration(
//                   color: _currentIndex == 0
//                       ? Colors.green.withOpacity(0.2)
//                       : Colors.transparent,
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 child: const Icon(
//                   Icons.dashboard,
//                 ),
//               ),
//               label: 'Dashboard',
//             ),
//             BottomNavigationBarItem(
//               backgroundColor: const Color.fromARGB(255, 192, 255, 194),
//
//               icon: Container(
//                   height: 40,
//                   width: 40,
//                   decoration: BoxDecoration(
//                     color: _currentIndex == 1
//                         ? Colors.green.withOpacity(0.2)
//                         : Colors.transparent,
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: const Icon(Icons.account_balance_wallet_rounded)),
//               label: 'BPro',
//             ),
//             BottomNavigationBarItem(
//               backgroundColor: const Color.fromARGB(255, 192, 255, 194),
//
//               icon: Container(
//                   height: 40,
//                   width: 40,
//                   decoration: BoxDecoration(
//                     color: _currentIndex == 2
//                         ? Colors.green.withOpacity(0.2)
//                         : Colors.transparent,
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: const Icon(Icons.swap_horiz)),
//               label: 'Transfer',
//             ),
//             BottomNavigationBarItem(
//               backgroundColor: const Color.fromARGB(255, 192, 255, 194),
//
//               icon: Container(
//                   height: 40,
//                   width: 40,
//                   decoration: BoxDecoration(
//                     color: _currentIndex == 3
//                         ? Colors.green.withOpacity(0.2)
//                         : Colors.transparent,
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: const Icon(Icons.offline_share_rounded)),
//               label: 'Withdraw',
//             ),
//           ],
//         ));
//   }
// }



import 'package:bpro_app_wallet/View/BPro_App_Wallet/bpro.dart';
import 'package:bpro_app_wallet/View/BPro_App_Wallet/dashboard.dart';
import 'package:bpro_app_wallet/View/BPro_App_Wallet/transfer.dart';
import 'package:bpro_app_wallet/View/BPro_App_Wallet/withdraw.dart';
import 'package:flutter/material.dart';

class BProWalletMain extends StatefulWidget {
  const BProWalletMain({super.key});

  @override
  _BProWalletMainState createState() => _BProWalletMainState();
}

class _BProWalletMainState extends State<BProWalletMain> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const Dashboard(),
    BPro(),
    const Transfer(),
    const Withdraw(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey[700],
        selectedFontSize: 15,
        unselectedFontSize: 15,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedIconTheme: const IconThemeData(
          size: 30,
        ),
        unselectedIconTheme: const IconThemeData(
          size: 30,
        ),
        selectedLabelStyle: const TextStyle(
          color: Colors.green,
          fontFamily: 'Kanit',
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.black,
          fontFamily: 'Kanit',
        ),
        items: [
          BottomNavigationBarItem(
            backgroundColor: const Color.fromARGB(255, 192, 255, 194),
            icon: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: _currentIndex == 0
                    ? Colors.green.withOpacity(0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(
                Icons.dashboard,
              ),
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color.fromARGB(255, 192, 255, 194),
            icon: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: _currentIndex == 1
                    ? Colors.green.withOpacity(0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(Icons.account_balance_wallet_rounded),
            ),
            label: 'BPro',
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color.fromARGB(255, 192, 255, 194),
            icon: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: _currentIndex == 2
                    ? Colors.green.withOpacity(0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(Icons.swap_horiz),
            ),
            label: 'Transfer',
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color.fromARGB(255, 192, 255, 194),
            icon: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: _currentIndex == 3
                    ? Colors.green.withOpacity(0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(Icons.offline_share_rounded),
            ),
            label: 'Withdraw',
          ),
        ],
      ),
    );
  }
}
