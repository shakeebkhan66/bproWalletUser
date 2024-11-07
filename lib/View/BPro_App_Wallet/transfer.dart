import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../providers/deposit_details_get.dart';
import '../../sharedpreference/sharedpref_class.dart';

class Transfer extends StatefulWidget {
  const Transfer({super.key});

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  final TextEditingController _amountController = TextEditingController();
  bool changeTransfer = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DepositDetailsProvider>(context);
    var userId = MySharedPrefClass.preferences!.getString("userID");

    void switchTransfer() {
      setState(() {
        changeTransfer = !changeTransfer;
      });
    }

    void handleTransfer() {
      final amount = double.tryParse(_amountController.text) ?? 0;
      final accountTransferMethod = changeTransfer ? 'BPro Account to Wallet' : 'Wallet to BPro Account';
      const status = 'pending';

      if (amount > 0) {
        provider.transferAmount(
          amount: amount,
          userId: userId.toString(),
          status: status,
          context: context,
          changeTransfer: accountTransferMethod,
        );
      } else {
        Fluttertoast.showToast(msg: "Please enter a valid amount.");
      }
    }

    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.green.withOpacity(0.8),
    //     automaticallyImplyLeading: false,
    //     title: const Text(
    //       'Transfer Balance',
    //       style: TextStyle(
    //         color: Colors.white,
    //         fontSize: 24,
    //         fontWeight: FontWeight.bold,
    //         fontFamily: 'Kanit',
    //       ),
    //     ),
    //     centerTitle: true,
    //   ),
    //   body: Theme(
    //     data: Theme.of(context).copyWith(
    //       textSelectionTheme: const TextSelectionThemeData(
    //         cursorColor: Colors.green,
    //         selectionHandleColor: Colors.green,
    //       ),
    //     ),
    //     child: Padding(
    //       padding: const EdgeInsets.all(20.0),
    //       child: SingleChildScrollView(
    //         child: Column(
    //           children: [
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Column(
    //                   children: [
    //                     RichText(
    //                       text: TextSpan(
    //                         children: [
    //                           const TextSpan(
    //                               text: 'From ',
    //                               style: TextStyle(
    //                                   color: Colors.black,
    //                                   fontSize: 15,
    //                                   fontFamily: 'Kanit',
    //                                   decoration: TextDecoration.none)),
    //                           TextSpan(
    //                             text: changeTransfer
    //                                 ? 'my BPro Account'
    //                                 : 'this wallet',
    //                             style: const TextStyle(
    //                                 color: Colors.green,
    //                                 decoration: TextDecoration.none,
    //                                 fontFamily: 'Kanit',
    //                                 fontSize: 15),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                     const Icon(Icons.arrow_downward),
    //                     RichText(
    //                       text: TextSpan(
    //                         children: [
    //                           const TextSpan(
    //                               text: 'To ',
    //                               style: TextStyle(
    //                                   color: Colors.black,
    //                                   fontSize: 15,
    //                                   fontFamily: 'Kanit',
    //                                   decoration: TextDecoration.none)),
    //                           TextSpan(
    //                             text: changeTransfer
    //                                 ? 'this wallet'
    //                                 : 'my BPro Account',
    //                             style: const TextStyle(
    //                                 color: Colors.green,
    //                                 fontFamily: 'Kanit',
    //                                 decoration: TextDecoration.none,
    //                                 fontSize: 15),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 IconButton(
    //                   onPressed: switchTransfer,
    //                   icon: const Icon(Icons.swap_horiz),
    //                   iconSize: 30,
    //                 )
    //               ],
    //             ),
    //             const SizedBox(
    //               height: 20,
    //             ),
    //             TextField(
    //               controller: _amountController,
    //               style: const TextStyle(
    //                   color: Colors.black,
    //                   fontFamily: 'Kanit'),
    //               keyboardType: TextInputType.number,
    //               decoration: const InputDecoration(
    //                 labelText: 'Enter Amount',
    //                 hintText: '1000',
    //                 labelStyle: TextStyle(
    //                   color: Colors.black,
    //                   fontFamily: 'Kanit',
    //                 ),
    //                 hintStyle: TextStyle(
    //                   color: Colors.grey,
    //                   fontFamily: 'Kanit',
    //                 ),
    //                 focusedBorder: OutlineInputBorder(
    //                   borderSide: BorderSide(color: Colors.green),
    //                   borderRadius: BorderRadius.all(Radius.circular(10)),
    //                 ),
    //                 border: OutlineInputBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(10)),
    //                 ),
    //               ),
    //             ),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 const Padding(
    //                   padding: EdgeInsets.all(5.0),
    //                   child: Text(
    //                     'Available Balance',
    //                     style: TextStyle(
    //                       color: Colors.black,
    //                       fontSize: 12,
    //                       fontFamily: 'Kanit',
    //                     ),
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.all(5.0),
    //                   child: Text(
    //                     'Rs. ${provider.availableBalance}',
    //                     style: const TextStyle(
    //                       color: Colors.green,
    //                       fontSize: 12,
    //                       fontFamily: 'Kanit',
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             const SizedBox(
    //               height: 20,
    //             ),
    //             SizedBox(
    //               width: 250,
    //               child: ElevatedButton(
    //                 style: ElevatedButton.styleFrom(
    //                   padding: const EdgeInsets.all(10),
    //                   foregroundColor: Colors.white,
    //                   backgroundColor: Colors.green,
    //                 ),
    //                 onPressed: handleTransfer,
    //                 child: const Text('Transfer',
    //                     style: TextStyle(
    //                         fontSize: 15,
    //                         fontFamily: 'Kanit',
    //                         fontWeight: FontWeight.bold,
    //                         letterSpacing: 2)),
    //               ),
    //             ),
    //             const SizedBox(
    //               height: 20,
    //             ),
    //             Container(
    //               padding: const EdgeInsets.all(5),
    //               width: double.infinity,
    //               child: const Text(
    //                 'Transfer History',
    //                 style: TextStyle(
    //                   fontFamily: 'Kanit',
    //                   color: Colors.black,
    //                   fontSize: 15,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //             ),
    //             Consumer<DepositDetailsProvider>(
    //               builder: (context, transferProvider, child) {
    //                 if (transferProvider.transfers.isEmpty) {
    //                   return const Center(child: Text('No Transfer History Found'));
    //                 }
    //                 return ListView.builder(
    //                   shrinkWrap: true,
    //                   physics: const NeverScrollableScrollPhysics(),
    //                   itemCount: transferProvider.transfers.length,
    //                   itemBuilder: (context, index) {
    //                     final transfer = transferProvider.transfers[index];
    //                     print("transfer length ${transferProvider.transfers.length}");
    //                     if (transfer.status != 'accepted') {
    //                       return const SizedBox.shrink();
    //                     }
    //                     return Column(
    //                       children: [
    //                         ListTile(
    //                           title: const Text(
    //                             'Transfer',
    //                             style: TextStyle(
    //                                 color: Colors.green, fontWeight: FontWeight.bold, fontFamily: 'Kanit'),
    //                           ),
    //                           subtitle: Column(
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: [
    //                               SizedBox(
    //                                 width: double.infinity,
    //                                 child: Text(
    //                                   transfer.accountTransferMethod,
    //                                   style: const TextStyle(fontFamily: 'Kanit'),
    //                                 ),
    //                               ),
    //                               SizedBox(
    //                                 width: double.infinity,
    //                                 child: Text(
    //                                   transfer.status,
    //                                   style: const TextStyle(fontFamily: 'Kanit'),
    //                                 ),
    //                               ),
    //                               SizedBox(
    //                                 width: double.infinity,
    //                                 child: Text(
    //                                   'Rs. ${transfer.amount}',
    //                                   style: const TextStyle(fontFamily: 'Kanit'),
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                           leading: const Icon(Icons.swap_horiz),
    //                           trailing: Row(
    //                             mainAxisSize: MainAxisSize.min,
    //                             children: [
    //                               Text(
    //                                 transfer.timestamp.toString(),
    //                                 style: const TextStyle(fontSize: 15, fontFamily: 'Kanit'),
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                         const Divider(),
    //                         Padding(
    //                           padding: const EdgeInsets.all(8.0),
    //                           child: Row(
    //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                             children: [
    //                               Text(
    //                                 transfer.status,
    //                                 style: const TextStyle(color: Colors.green, fontFamily: 'Kanit'),
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ],
    //                     );
    //                   },
    //                 );
    //               },
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.withOpacity(0.8),
        automaticallyImplyLeading: false,
        title: const Text(
          'Transfer Balance',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Kanit',
          ),
        ),
        centerTitle: true,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.green,
            selectionHandleColor: Colors.green,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'From ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Kanit',
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              TextSpan(
                                text: changeTransfer
                                    ? 'my BPro Account'
                                    : 'this wallet',
                                style: const TextStyle(
                                  color: Colors.green,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Kanit',
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_downward),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'To ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Kanit',
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              TextSpan(
                                text: changeTransfer
                                    ? 'this wallet'
                                    : 'my BPro Account',
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'Kanit',
                                  decoration: TextDecoration.none,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: switchTransfer,
                      icon: const Icon(Icons.swap_horiz),
                      iconSize: 30,
                    )
                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _amountController,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Kanit',
                  ),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Enter Amount',
                    hintText: '1000',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Kanit',
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Kanit',
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        'Available Balance',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Kanit',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'Rs. ${provider.availableBalance}',
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                          fontFamily: 'Kanit',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                    onPressed: handleTransfer,
                    child: const Text(
                      'Transfer',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(5),
                  width: double.infinity,
                  child: const Text(
                    'Transfer History',
                    style: TextStyle(
                      fontFamily: 'Kanit',
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Consumer<DepositDetailsProvider>(
                  builder: (context, transferProvider, child) {
                    if (transferProvider.transfers.isEmpty) {
                      return const Center(
                        child: Text('No Transfer History Found'),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: transferProvider.transfers.length,
                      itemBuilder: (context, index) {
                        final transfer = transferProvider.transfers[index];
                        if (transfer.status != 'accepted') {
                          return const SizedBox.shrink();
                        }
                        return Column(
                          children: [
                            ListTile(
                              title: const Text(
                                'Transfer',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Kanit',
                                ),
                              ),
                              subtitle: Text(
                                transfer.accountTransferMethod ,
                                style: const TextStyle(
                                  fontFamily: 'Kanit',
                                ),
                              ),
                              trailing: Text(
                                '+${transfer.amount}',
                                style: const TextStyle(
                                  fontFamily: 'Kanit',
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(transfer.status,  style: const TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: 'Kanit',
                                ),),
                              ),
                            ),
                            const Divider(),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
