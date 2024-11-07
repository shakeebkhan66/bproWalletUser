// import 'package:bpro_app_wallet/View/BPro_App_Wallet/profile.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../providers/deposit.dart';
// import '../../providers/deposit_details_get.dart';
// import 'deposit.dart';
//
//
// class Dashboard extends StatefulWidget {
//   @override
//   State<Dashboard> createState() => _DashboardState();
// }
//
// class _DashboardState extends State<Dashboard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         centerTitle: true,
//         leading: Container(
//           margin: const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(50),
//             color: Colors.white,
//           ),
//           child: const Icon(
//             Icons.account_balance_wallet_rounded,
//             color: Colors.green,
//           ),
//         ),
//         title: const Text(
//           'BPro App Wallet',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'Kanit',
//           ),
//         ),
//         actions: <Widget>[
//           Container(
//             height: 40,
//             width: 40,
//             margin: const EdgeInsets.only(right: 8),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(50),
//               color: Colors.white,
//             ),
//             child: IconButton(
//               icon: const Icon(Icons.person),
//               color: Colors.green,
//               iconSize: 25,
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Profile()),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           physics: ScrollPhysics(),
//           child: Column(
//             children: [
//               ListTile(
//                 tileColor: Colors.green.withOpacity(0.8),
//                 title: const Text(
//                   'Account Balance',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                     fontFamily: 'Kanit',
//                   ),
//                 ),
//                 subtitle: const Text(
//                   '0.00',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                     fontFamily: 'Kanit',
//                   ),
//                 ),
//                 trailing: ElevatedButton(
//                   style: TextButton.styleFrom(
//                     minimumSize: const Size(70, 50),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const Deposit()),
//                     );
//                   },
//                   child: const Text(
//                     'Deposit',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                       fontFamily: 'Kanit',
//                     ),
//                   ),
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               ListTile(
//                 tileColor: Colors.green.withOpacity(0.8),
//                 title: const Text(
//                   'BPro Account',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                     fontFamily: 'Kanit',
//                   ),
//                 ),
//                 trailing: const Text(
//                   'Not Activated',
//                   style: TextStyle(
//                     color: Colors.red,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                     fontFamily: 'Kanit',
//                   ),
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   border: Border.all(color: Colors.amber.withOpacity(0.8)),
//                 ),
//                 child: ListTile(
//                   tileColor: Colors.white,
//                   title: const Row(
//                     children: [
//                       Icon(
//                         Icons.live_tv_rounded,
//                         color: Colors.amber,
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         'Watch Tutorial',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                           fontFamily: 'Kanit',
//                         ),
//                       ),
//                     ],
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const SizedBox(
//                 width: double.infinity,
//                 child: Text(
//                   'Transaction History',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                     fontFamily: 'Kanit',
//                   ),
//                 ),
//               ),
//               Consumer<DepositDetailsProvider>(
//                 builder: (context, depositProvider, child) {
//                   if (depositProvider.isLoading) {
//                     return const Center(child: CircularProgressIndicator());
//                   }
//                   if (depositProvider.deposits.isEmpty) {
//                     return const Center(child: Text('No transactions found.'));
//                   }
//                   return ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: depositProvider.deposits.length,
//                     itemBuilder: (context, index) {
//                       final deposit = depositProvider.deposits[index];
//                       return ListTile(
//                         title: Text(deposit.userId),
//                         subtitle: Text(
//                           'Amount: ${deposit.amount}\nStatus: ${deposit.status}',
//                         ),
//                         trailing: Text(deposit.timestamp.toString()),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: Stack(
//         children: [
//           Positioned(
//             bottom: 65,
//             right: 0,
//             child: FloatingActionButton(
//               onPressed: () {},
//               backgroundColor: Colors.white,
//               child: const Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     'Share',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 15,
//                       fontFamily: 'Kanit',
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(bottom: 8.0),
//                     child: Icon(Icons.share_sharp),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             right: 0,
//             child: FloatingActionButton(
//               onPressed: () {},
//               backgroundColor: Colors.green,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Text(
//                     'Help',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 15,
//                       fontFamily: 'Kanit',
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 8.0),
//                     child: Image.asset(
//                       'assets/images/whatsapp_icon.png',
//                       height: 25,
//                       width: 25,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:bpro_app_wallet/View/BPro_App_Wallet/profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../providers/deposit_details_get.dart';
import 'deposit.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  void _launchWhatsApp() async {
    try {
      String phoneNumber = phoneNoController.text.replaceAll('+', '');
      String message = Uri.encodeFull(messageController.text);
      String url = 'whatsapp://send?phone=$phoneNumber&text=$message';
      await launchUrlString(url);
    } catch (e) {
      if (kDebugMode) {
        print('Error Launching WhatsApp: $e');
      }
    }
  }

  void _showInputSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: phoneNoController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  prefixText: '+',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: messageController,
                decoration: const InputDecoration(
                  labelText: 'Message',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                maxLines: 3,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _launchWhatsApp();
                },
                child: const Text('Open WhatsApp'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
          ),
          child: const Icon(
            Icons.account_balance_wallet_rounded,
            color: Colors.green,
          ),
        ),
        title: const Text(
          'BPro App Wallet',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Kanit',
          ),
        ),
        actions: <Widget>[
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            child: IconButton(
              icon: const Icon(Icons.person),
              color: Colors.green,
              iconSize: 25,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profile()),
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Consumer<DepositDetailsProvider>(
                builder: (context, depositProvider, child) {
                  return ListTile(
                    tileColor: Colors.green.withOpacity(0.8),
                    title: const Text(
                      'Account Balance',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Kanit',
                      ),
                    ),
                    subtitle: Text(
                      depositProvider.availableBalance.toStringAsFixed(2),
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'Kanit',
                      ),
                    ),
                    trailing: ElevatedButton(
                      style: TextButton.styleFrom(
                        minimumSize: const Size(70, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (depositProvider.canAddDeposit) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Deposit()),
                          );
                        } else {
                          Fluttertoast.showToast(
                            msg: "You can deposit more when the last added amount is approved or rejected",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      },
                      child: const Text(
                        'Deposit',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: 'Kanit',
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              Consumer<DepositDetailsProvider>(
                builder: (context, depositProvider, child) {
                  if (depositProvider.deposits.isEmpty) {
                    return ListTile(
                      tileColor: Colors.green.withOpacity(0.8),
                      title: const Text(
                        'BPro Account',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Kanit',
                        ),
                      ),
                      trailing: const Text(
                        'Not Activated',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: 'Kanit',
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  }
                  final deposit = depositProvider.deposits.first;
                  return Column(
                    children: [
                      deposit.stateOfUser == 'active'
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height * .25,
                              child: Card(
                                color: Colors.green.withOpacity(0.8),
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'BPro Account',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              fontFamily: 'Kanit',
                                            ),
                                          ),
                                          Text(
                                            'Activated',
                                            style: TextStyle(
                                              color: Colors.amber,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              fontFamily: 'Kanit',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      height: 50,
                                      alignment: Alignment.topLeft,
                                      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                                      margin: const EdgeInsets.symmetric(horizontal: 10),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.white,
                                      ),
                                      child: Text(
                                        deposit.bProAccountUserName,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          fontFamily: 'Kanit',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      height: 50,
                                      alignment: Alignment.topLeft,
                                      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                                      margin: const EdgeInsets.symmetric(horizontal: 10),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.white,
                                      ),
                                      child: Text(
                                        deposit.bProAccountPassword,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          fontFamily: 'Kanit',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : ListTile(
                              tileColor: Colors.green.withOpacity(0.8),
                              title: const Text(
                                'BPro Account',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: 'Kanit',
                                ),
                              ),
                              trailing: const Text(
                                'Not Activated',
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily: 'Kanit',
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            )
                    ],
                  );
                },
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.amber.withOpacity(0.8)),
                ),
                child: ListTile(
                  tileColor: Colors.white,
                  title: const Row(
                    children: [
                      Icon(
                        Icons.live_tv_rounded,
                        color: Colors.amber,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Watch Tutorial',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Kanit',
                        ),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'Transaction History',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Kanit',
                  ),
                ),
              ),
              Consumer<DepositDetailsProvider>(
                builder: (context, depositProvider, child) {
                  if (depositProvider.isLoading) {
                    return const SizedBox(height: 300, child: Center(child: Text("No Transaction History Found")));
                  }
                  if (depositProvider.deposits.isEmpty) {
                    return const Center(child: Text('No transactions found.'));
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: depositProvider.deposits.length,
                    itemBuilder: (context, index) {
                      final deposit = depositProvider.deposits[index];
                      print("deposit list ${depositProvider.deposits.length}");
                      print("deposit list ${deposit.amount}");
                      return ListTile(
                        title: Text(deposit.username),
                        subtitle: Text(
                          'Amount: ${deposit.amount}\nStatus: ${deposit.status}',
                        ),
                        trailing: Text(deposit.timestamp.toString()),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 65,
            right: 0,
            child: FloatingActionButton(
              onPressed: () {
                Share.share("Open this link to see this post www.google.com", subject: "Look what i make for you");
              },
              backgroundColor: Colors.white,
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Share',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Kanit',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Icon(Icons.share_sharp),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: FloatingActionButton(
              onPressed: () {
                _showInputSheet(context);
              },
              backgroundColor: Colors.green,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Help',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Kanit',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Image.asset(
                      'assets/images/whatsapp_icon.png',
                      height: 25,
                      width: 25,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
