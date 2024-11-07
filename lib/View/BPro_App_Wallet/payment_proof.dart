// import 'package:bpro_app_wallet/View/BPro_App_Wallet/bpro_app_wallet_main.dart';
// import 'package:bpro_app_wallet/View/Controller_And_Constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:intl/intl.dart';
//
// class PaymentProof extends StatefulWidget {
//   final Widget accountTile;
//   final String amount;
//
//   PaymentProof({required this.accountTile, required this.amount});
//
//   @override
//   _PaymentProofState createState() => _PaymentProofState();
// }
//
// class _PaymentProofState extends State<PaymentProof> {
//   bool chk = true;
//
//   void hostoryAdded() {
//     if (chk) {
//       DateTime now = DateTime.now();
//       String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
//       chk = false;
//       setState(() {
//         historyTiles.add(Column(
//           children: [
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.green),
//                 borderRadius: const BorderRadius.all(Radius.circular(10)),
//               ),
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Container(
//                       child: ListTile(
//                         title: const Text(
//                           'Deposit',
//                           style: TextStyle(
//                               color: Colors.green,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Kanit'),
//                         ),
//                         subtitle: Column(
//                           children: [
//                             Container(
//                                 width: double.infinity,
//                                 child: Text(
//                                   accountHolderName,
//                                   style: TextStyle(fontFamily: 'Kanit'),
//                                 )),
//                             Container(
//                                 width: double.infinity,
//                                 child: Text(
//                                   accountTypeNumber,
//                                   style: TextStyle(fontFamily: 'Kanit'),
//                                 )),
//                           ],
//                         ),
//                         leading: const Icon(Icons.download),
//                         trailing: Text(
//                           'Rs. ${widget.amount}',
//                           style: const TextStyle(
//                               fontSize: 15, fontFamily: 'Kanit'),
//                         ),
//                       ),
//                     ),
//                     const Divider(),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             'Pending',
//                             style: TextStyle(
//                                 color: Colors.red, fontFamily: 'Kanit'),
//                           ),
//                           Text(
//                             '$formattedDate',
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'Kanit'),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ));
//       });
//     }
//   }
//
//   File? _image;
//
//   Future<void> _pickImage() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? pickedFile =
//         await picker.pickImage(source: ImageSource.gallery);
//
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         leading: const Icon(
//           Icons.arrow_back_ios_new,
//           color: Colors.green,
//           size: 25,
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Text(
//                 'Transfer Rs. ${widget.amount} to the following account, attach the payment proof, and click on submit.',
//                 style: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.red[800],
//                     fontFamily: 'Kanit'),
//               ),
//               const SizedBox(height: 10),
//               widget.accountTile,
//               const SizedBox(height: 10),
//               Container(
//                 width: double.infinity,
//                 child: const Text('Upload Payment Proof',
//                     style: TextStyle(
//                         fontSize: 15,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Kanit')),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 width: double.infinity,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.green,
//                     width: 2,
//                   ),
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 230,
//                       child: _image == null
//                           ? const Center(
//                               child: Text(
//                               'Click on the following button to Upload Image proof',
//                               textAlign: TextAlign.center,
//                               style:
//                                   TextStyle(fontSize: 15, fontFamily: 'Kanit'),
//                             ))
//                           : Image.file(_image!),
//                     ),
//                     const SizedBox(width: 20),
//                     Container(
//                       margin: EdgeInsets.only(bottom: 10),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           FloatingActionButton(
//                             onPressed: _pickImage,
//                             shape: const CircleBorder(),
//                             child: const Icon(
//                               Icons.upload_file,
//                               size: 40,
//                             ),
//                             backgroundColor: Colors.green,
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10),
//               Container(
//                   width: double.infinity,
//                   child: const Text(
//                     'Instructions',
//                     style: TextStyle(
//                         color: Colors.red,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 14,
//                         fontFamily: 'Kanit'),
//                   )),
//               Container(
//                   width: double.infinity,
//                   child: const Text(
//                     '1. Send payment on above account',
//                     style: TextStyle(
//                         color: Colors.red,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Kanit',
//                         fontSize: 14),
//                   )),
//               Container(
//                   width: double.infinity,
//                   child: const Text(
//                     '2. Upload payment proof and submit',
//                     style: TextStyle(
//                         color: Colors.red,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Kanit',
//                         fontSize: 14),
//                   )),
//               Container(
//                   width: double.infinity,
//                   child: const Text(
//                     '3. Payment will be approved within 30 minutes',
//                     style: TextStyle(
//                         color: Colors.red,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Kanit',
//                         fontSize: 14),
//                   )),
//               const SizedBox(
//                 height: 10,
//               ),
//               Container(
//                   width: double.infinity,
//                   child: const Text(
//                     'اوپر دیئے گئے اکاؤنٹ پر ادائیگی بھیجیں۔',
//                     textAlign: TextAlign.end,
//                     style: TextStyle(
//                         color: Colors.red,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Kanit',
//                         fontSize: 14),
//                   )),
//               Container(
//                   width: double.infinity,
//                   child: const Text(
//                     'اپنے ادائیگی کا ثبوت اپ لوڈ کریں اور جمع کروائیں۔',
//                     textAlign: TextAlign.end,
//                     style: TextStyle(
//                         color: Colors.red,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Kanit',
//                         fontSize: 14),
//                   )),
//               Container(
//                   width: double.infinity,
//                   child: const Text(
//                     'ادائیگی 30 منٹ کے اندر منظور کر لی جائے گی۔',
//                     textAlign: TextAlign.end,
//                     style: TextStyle(
//                         color: Colors.red,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Kanit',
//                         fontSize: 14),
//                   )),
//               const SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 width: 250,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.all(10),
//                     foregroundColor: Colors.white,
//                     backgroundColor: Colors.green,
//                   ),
//                   onPressed: () {
//                     if (_image == null) {
//                       Fluttertoast.showToast(
//                         msg: 'Please upload payment proof first',
//                         toastLength: Toast.LENGTH_SHORT,
//                         gravity: ToastGravity.BOTTOM,
//                         timeInSecForIosWeb: 1,
//                         backgroundColor: Colors.black.withOpacity(0.5),
//                         textColor: Colors.white,
//                         fontSize: 16.0,
//                       );
//                     } else {
//                       Fluttertoast.showToast(
//                         msg: 'Payment Proof Submitted Successfully',
//                         toastLength: Toast.LENGTH_SHORT,
//                         gravity: ToastGravity.BOTTOM,
//                         timeInSecForIosWeb: 1,
//                         backgroundColor: Colors.black.withOpacity(0.5),
//                         textColor: Colors.white,
//                         fontSize: 16.0,
//                       );
//                       hostoryAdded();
//                       Navigator.pushAndRemoveUntil(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => BProWalletMain()),
//                         (Route<dynamic> route) => false,
//                       );
//                     }
//                   },
//                   child: const Text('SUBMIT',
//                       style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                           letterSpacing: 4,
//                           fontFamily: 'Kanit',
//                           height: 1.5)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:bpro_app_wallet/View/Controller_And_Constants.dart';
import 'package:bpro_app_wallet/models/account_model.dart';
import 'package:bpro_app_wallet/models/deposit_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../providers/deposit.dart';

class PaymentProof extends StatefulWidget {
  final Widget accountTile;
  final Account account;
  final String amount;
  final String userName;

  PaymentProof({required this.accountTile, required this.account, required this.amount, required this.userName});

  @override
  _PaymentProofState createState() => _PaymentProofState();
}

class _PaymentProofState extends State<PaymentProof> {
  bool chk = true;
  File? _image;

  void hostoryAdded() {
    if (chk) {
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
      chk = false;
      setState(() {
        historyTiles.add(
            Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      title: const Text(
                        'Deposit',
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Kanit'),
                      ),
                      subtitle: Column(
                        children: [
                          SizedBox(
                              width: double.infinity,
                              child: Text(
                                accountHolderName,
                                style: const TextStyle(fontFamily: 'Kanit'),
                              )),
                          SizedBox(
                              width: double.infinity,
                              child: Text(
                                accountTypeNumber,
                                style: const TextStyle(fontFamily: 'Kanit'),
                              )),
                        ],
                      ),
                      leading: const Icon(Icons.download),
                      trailing: Text(
                        'Rs. ${widget.amount}',
                        style: const TextStyle(
                            fontSize: 15, fontFamily: 'Kanit'),
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Pending',
                            style: TextStyle(
                                color: Colors.red, fontFamily: 'Kanit'),
                          ),
                          Text(
                            formattedDate,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Kanit'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
        );
      });
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
    await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.green,
          size: 25,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Transfer Rs. ${widget.amount} to the following account, attach the payment proof, and click on submit.',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[800],
                    fontFamily: 'Kanit'),
              ),
              const SizedBox(height: 10),
              widget.accountTile,
              const SizedBox(height: 10),
              const SizedBox(
                width: double.infinity,
                child: Text('Upload Payment Proof',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Kanit')),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 230,
                      child: _image == null
                          ? const Center(
                          child: Text(
                            'Click on the following button to Upload Image proof',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15, fontFamily: 'Kanit'),
                          ))
                          : Image.file(_image!),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FloatingActionButton(
                            onPressed: _pickImage,
                            shape: const CircleBorder(),
                            backgroundColor: Colors.green,
                            child: const Icon(
                              Icons.upload_file,
                              size: 40,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Instructions',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: 'Kanit'),
                  )),
              const SizedBox(
                  width: double.infinity,
                  child: Text(
                    '1. Send payment on above account',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Kanit',
                        fontSize: 14),
                  )),
              const SizedBox(
                  width: double.infinity,
                  child: Text(
                    '2. Upload payment proof and submit',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Kanit',
                        fontSize: 14),
                  )),
              const SizedBox(
                  width: double.infinity,
                  child: Text(
                    '3. Payment will be approved within 30 minutes',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Kanit',
                        fontSize: 14),
                  )),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'اوپر دیئے گئے اکاؤنٹ پر ادائیگی بھیجیں۔',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Kanit',
                        fontSize: 14),
                  )),
              const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'اپنے ادائیگی کا ثبوت اپ لوڈ کریں اور جمع کروائیں۔',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Kanit',
                        fontSize: 14),
                  )),
              const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'ادائیگی 30 منٹ کے اندر منظور کر لی جائے گی۔',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Kanit',
                        fontSize: 14),
                  )),
              const SizedBox(
                height: 20,
              ),
              Consumer<DepositProvider>(
                builder: (context, depositProvider, child) {
                  return depositProvider.isLoading
                      ? const CircularProgressIndicator()
                      : SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        if (_image == null) {
                          Fluttertoast.showToast(
                            msg: 'Please upload payment proof first',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black.withOpacity(0.5),
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        } else {
                          final deposit = DepositModel(
                            userId: FirebaseAuth.instance.currentUser!.uid,
                            username: widget.userName,
                            amount: double.parse(widget.amount),
                            typeOfAmount: "Deposit",
                            paymentType: widget.account.bankName,
                            image: _image!.path,
                            status: "pending",
                            stateOfUser: "inActive",
                            accountNumber: widget.account.accountNumber,
                            bProAccountUserName: "", bProAccountPassword: "",
                            timestamp: DateTime.now(),
                          );
                          if (kDebugMode) {
                            if (kDebugMode) {
                              print("sssssssssssssssssssssssssssssssssssssssss");
                            }
                          }
                          depositProvider.addDeposit(deposit, context);
                          Fluttertoast.showToast(
                            msg: 'Payment Proof Submitted Successfully',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black.withOpacity(0.5),
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      },
                      child: const Text('SUBMIT',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 4,
                              fontFamily: 'Kanit',
                              height: 1.5)),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
