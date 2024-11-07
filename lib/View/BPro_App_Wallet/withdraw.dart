// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
//
// class Withdraw extends StatefulWidget {
//   @override
//   State<Withdraw> createState() => _WithdrawState();
// }
//
// class _WithdrawState extends State<Withdraw> {
//   int? _radioValue = 0;
//   List<Widget> widgets = [];
//   bool widgetNotAdded = true;
//
//   void bankNameTextField() {
//     if (widgetNotAdded && _radioValue == 3) {
//       setState(() {
//         widgets.add(const TextField(
//           keyboardType: TextInputType.text,
//           style: const TextStyle(
//               color: Colors.black,
//               fontFamily: 'Kanit'),
//           decoration: InputDecoration(
//             labelText: 'Enter Bank Name',
//             hintText: 'Bank Name',
//             labelStyle: TextStyle(color: Colors.black, fontFamily: 'Kanit'),
//             hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Kanit'),
//             suffixStyle: TextStyle(color: Colors.green),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.green),
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//             ),
//           ),
//         ));
//       });
//       widgetNotAdded = false;
//     } else if (_radioValue != 3 && !widgetNotAdded) {
//       setState(() {
//         widgets.clear();
//         widgetNotAdded = true;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Theme(
//           data: Theme.of(context).copyWith(
//             textSelectionTheme: const TextSelectionThemeData(
//               cursorColor: Colors.green, // Change global cursor color here
//               selectionHandleColor: Colors.green, // Change handle color here
//             ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(10),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(10),
//                     width: double.infinity,
//                     child: const Text(
//                       'Transfer History',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontFamily: 'Kanit',
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   const TextField(
//                     keyboardType: TextInputType.number,
//                     style: const TextStyle(
//                         color: Colors.black,
//                         fontFamily: 'Kanit'),
//                     decoration: InputDecoration(
//                       labelText: 'Enter Amount',
//                       hintText: '1000',
//                       labelStyle: TextStyle(color: Colors.black, fontFamily: 'Kanit'),
//                       hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Kanit'),
//                       suffixText: 'MAX',
//                       suffixStyle: TextStyle(color: Colors.green),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.green),
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                       ),
//                     ),
//                   ),
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.all(5.0),
//                         child: Text(
//                           'Available Balance',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 12,
//                             fontFamily: 'Kanit'
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(5.0),
//                         child: Text(
//                           'Rs. 0',
//                           style: TextStyle(
//                             color: Colors.green,
//                             fontSize: 12,
//                             fontFamily: 'Kanit'
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Container(
//                     width: double.infinity,
//                     child: const Text(
//                       'Account Details',
//                       style: TextStyle(
//                         fontFamily: 'Kanit',
//                         color: Colors.black,
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.all(10),
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.green),
//                       borderRadius: const BorderRadius.all(Radius.circular(10)),
//                     ),
//                     child: Column(children: [
//                       Container(
//                           width: double.infinity,
//                           child: const Text('Choose Payment Method',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontFamily: 'Kanit',
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.bold,
//                               ))),
//                       const SizedBox(height: 10),
//                       Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.green),
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(10)),
//                         ),
//                         child: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               _radioValue = 1;
//                               bankNameTextField();
//                             });
//                           },
//                           child: ListTile(
//                             title: const Text('EasyPaisa',
//                             style: TextStyle(
//                               fontFamily: 'Kanit'
//                             ),
//                             ),
//                             leading: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Radio<int>(
//                                   value: 1,
//                                   activeColor: Colors.green,
//                                   groupValue: _radioValue,
//                                   onChanged: (int? value) {
//                                     setState(() {
//                                       _radioValue = value;
//                                       bankNameTextField();
//                                     });
//                                   },
//                                 ),
//                                 Image.asset('assets/images/easypaisa.png',
//                                     width: 40, height: 40),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.green),
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(10)),
//                         ),
//                         child: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               _radioValue = 2;
//                               bankNameTextField();
//                             });
//                           },
//                           child: ListTile(
//                             title: const Text('JazzCash', style: TextStyle(
//                               fontFamily: 'Kanit'
//                             ),),
//                             leading: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Radio<int>(
//                                   value: 2,
//                                   activeColor: Colors.green,
//                                   groupValue: _radioValue,
//                                   onChanged: (int? value) {
//                                     setState(() {
//                                       _radioValue = value;
//                                       bankNameTextField();
//                                     });
//                                   },
//                                 ),
//                                 Image.asset('assets/images/jazzcash.jpg',
//                                     width: 40, height: 40),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.green),
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(10)),
//                         ),
//                         child: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               _radioValue = 3;
//                               bankNameTextField();
//                             });
//                           },
//                           child: ListTile(
//                             title: const Text('Bank', style: TextStyle(
//                               fontFamily: 'Kanit'
//                             ),),
//                             leading: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Radio<int>(
//                                   value: 3,
//                                   activeColor: Colors.green,
//                                   groupValue: _radioValue,
//                                   onChanged: (int? value) {
//                                     setState(() {
//                                       _radioValue = value;
//                                       bankNameTextField();
//                                     });
//                                   },
//                                 ),
//                                 const Icon(
//                                   Icons.account_balance,
//                                   color: Colors.black,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Container(
//                         child: ListView.builder(
//                           shrinkWrap: true,
//                           itemCount: widgets.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return widgets[index];
//                           },
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       const TextField(
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontFamily: 'Kanit'),
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                           labelText: 'Enter Account Number',
//                           hintText: 'Account Number',
//                           labelStyle: TextStyle(color: Colors.black, fontFamily: 'Kanit'),
//                           hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Kanit'),
//                           suffixStyle: TextStyle(color: Colors.green),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.green),
//                             borderRadius: BorderRadius.all(Radius.circular(10)),
//                           ),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(10)),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       const TextField(
//                         style: const TextStyle(
//                             color: Colors.black,
//                             fontFamily: 'Kanit'),
//                         keyboardType: TextInputType.text,
//                         decoration: InputDecoration(
//                           labelText: 'Enter Account Title',
//                           hintText: 'Account Title',
//                           labelStyle: TextStyle(color: Colors.black, fontFamily: 'Kanit'),
//                           hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Kanit'),
//                           suffixStyle: TextStyle(color: Colors.green),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.green),
//                             borderRadius: BorderRadius.all(Radius.circular(10)),
//                           ),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(10)),
//                           ),
//                         ),
//                       ),
//                     ]),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Container(
//                     width: 250,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.all(10),
//                         foregroundColor: Colors.white,
//                         backgroundColor: Colors.green,
//                       ),
//                       onPressed: () {},
//                       child: const Text('Transfer',
//                           style: TextStyle(
//                               fontSize: 15,
//                               fontFamily: 'Kanit',
//                               fontWeight: FontWeight.bold,
//                               letterSpacing: 2)),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Container(
//                       color: Colors.amber.withOpacity(0.4),
//                       child: const Text('آپ کو 12 گھنٹے میں ادائیگی کردی جائے گی۔',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 15,
//                             fontFamily: 'Kanit',
//                             fontWeight: FontWeight.bold,
//                           ))),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../models/withdraw_model.dart';
import '../../providers/deposit_details_get.dart';

class Withdraw extends StatefulWidget {
  const Withdraw({super.key});

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _accountNoController = TextEditingController();
  final TextEditingController _accountTitleController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();



  int? _radioValue = 0;
  List<Widget> widgets = [];
  bool widgetNotAdded = true;

  @override
  void dispose() {
    _amountController.dispose();
    _accountNoController.dispose();
    _accountTitleController.dispose();
    _bankNameController.dispose();
    super.dispose();
  }

  void bankNameTextField() {
    if (widgetNotAdded && _radioValue == 3) {
      setState(() {
        widgets.add(TextFormField(
          controller: _bankNameController,
          keyboardType: TextInputType.text,
          style: const TextStyle(color: Colors.black, fontFamily: 'Kanit'),
          decoration: const InputDecoration(
            labelText: 'Enter Bank Name',
            hintText: 'Bank Name',
            labelStyle: TextStyle(color: Colors.black, fontFamily: 'Kanit'),
            hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Kanit'),
            suffixStyle: TextStyle(color: Colors.green),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ));
      });
      widgetNotAdded = false;
    } else if (_radioValue != 3 && !widgetNotAdded) {
      setState(() {
        widgets.clear();
        widgetNotAdded = true;
      });
    }
  }

  void _submitForm(DepositDetailsProvider provider) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    if (_formKey.currentState!.validate()) {
      final double amount = double.parse(_amountController.text);
      final String accountType = _radioValue == 1
          ? 'EasyPaisa'
          : _radioValue == 2
              ? 'JazzCash'
              : _bankNameController.text;
      final String accountNo = _accountNoController.text;
      final String accountTitle = _accountTitleController.text;

      provider.withdrawAmount(
        amount: amount,
        accountType: accountType,
        accountNo: accountNo,
        accountTitle: accountTitle,
        status: "pending",
        date: DateTime.now(),
        context: context,
      );
    }
  }


  Future<void> _showEditWithdrawDialog(BuildContext context, WithdrawModel withdraw, DepositDetailsProvider withdrawProvider) {

    // DateTime now = DateTime.now();
    // String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

    final TextEditingController accountTitleController = TextEditingController(text: withdraw.accountTitle);
    final TextEditingController accountNoController = TextEditingController(text: withdraw.accountNo);
    final TextEditingController accountTypeController = TextEditingController(text: withdraw.accountType);
    final TextEditingController amountController = TextEditingController(text: withdraw.amount.toString());

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Withdraw'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: accountTitleController,
                  decoration: const InputDecoration(labelText: 'Account Title'),
                ),
                TextField(
                  controller: accountNoController,
                  decoration: const InputDecoration(labelText: 'Account No'),
                ),
                TextField(
                  controller: accountTypeController,
                  decoration: const InputDecoration(labelText: 'Account Type'),
                ),
                TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Amount'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Update'),
              onPressed: () {
                final updatedWithdraw = WithdrawModel(
                  id: withdraw.id,
                  accountTitle: accountTitleController.text,
                  accountNo: accountNoController.text,
                  accountType: accountTypeController.text,
                  amount: double.parse(amountController.text),
                  status: withdraw.status,
                );
                withdrawProvider.updateWithdraw(withdraw.id!, updatedWithdraw);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }




  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DepositDetailsProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Theme(
          data: Theme.of(context).copyWith(
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.green,
              selectionHandleColor: Colors.green,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      child: const Text(
                        'Transfer History',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Kanit',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.black, fontFamily: 'Kanit'),
                      decoration: const InputDecoration(
                        labelText: 'Enter Amount',
                        hintText: '1000',
                        labelStyle: TextStyle(color: Colors.black, fontFamily: 'Kanit'),
                        hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Kanit'),
                        suffixText: 'MAX',
                        suffixStyle: TextStyle(color: Colors.green),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an amount';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        final amount = double.parse(value);
                        if (amount < 1000) {
                          return 'Please add withdraw amount at least 1000 or more';
                        }
                        if (amount > provider.availableBalance) {
                          return 'You are exceeding from total deposit amount';
                        }
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            'Available Balance',
                            style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: 'Kanit'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Rs. ${provider.availableBalance}',
                            style: const TextStyle(color: Colors.green, fontSize: 12, fontFamily: 'Kanit'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Account Details',
                        style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(children: [
                        const SizedBox(
                            width: double.infinity,
                            child: Text('Choose Payment Method',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Kanit',
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ))),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _radioValue = 1;
                                bankNameTextField();
                              });
                            },
                            child: ListTile(
                              title: const Text(
                                'EasyPaisa',
                                style: TextStyle(fontFamily: 'Kanit'),
                              ),
                              leading: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Radio<int>(
                                    value: 1,
                                    activeColor: Colors.green,
                                    groupValue: _radioValue,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _radioValue = value;
                                        bankNameTextField();
                                      });
                                    },
                                  ),
                                  Image.asset('assets/images/easypaisa.png', width: 40, height: 40),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _radioValue = 2;
                                bankNameTextField();
                              });
                            },
                            child: ListTile(
                              title: const Text(
                                'JazzCash',
                                style: TextStyle(fontFamily: 'Kanit'),
                              ),
                              leading: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Radio<int>(
                                    value: 2,
                                    activeColor: Colors.green,
                                    groupValue: _radioValue,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _radioValue = value;
                                        bankNameTextField();
                                      });
                                    },
                                  ),
                                  Image.asset('assets/images/jazzcash.jpg', width: 40, height: 40),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _radioValue = 3;
                                bankNameTextField();
                              });
                            },
                            child: ListTile(
                              title: const Text(
                                'Bank',
                                style: TextStyle(fontFamily: 'Kanit'),
                              ),
                              leading: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Radio<int>(
                                    value: 3,
                                    activeColor: Colors.green,
                                    groupValue: _radioValue,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _radioValue = value;
                                        bankNameTextField();
                                      });
                                    },
                                  ),
                                  const Icon(
                                    Icons.account_balance,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ...widgets,
                    TextFormField(
                      controller: _accountNoController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.black, fontFamily: 'Kanit'),
                      decoration: const InputDecoration(
                        labelText: 'Enter Account Number',
                        hintText: '000000000',
                        labelStyle: TextStyle(color: Colors.black, fontFamily: 'Kanit'),
                        hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Kanit'),
                        suffixStyle: TextStyle(color: Colors.green),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an account number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _accountTitleController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(color: Colors.black, fontFamily: 'Kanit'),
                      decoration: const InputDecoration(
                        labelText: 'Enter Account Title',
                        hintText: 'Account Title',
                        labelStyle: TextStyle(color: Colors.black, fontFamily: 'Kanit'),
                        hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Kanit'),
                        suffixStyle: TextStyle(color: Colors.green),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an account title';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    provider.isAddingWithdraw
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () => _submitForm(provider),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              fixedSize: const Size(150, 40),
                            ),
                            child: const Text(
                              'Withdraw',
                              style: TextStyle(color: Colors.white, fontFamily: 'Kanit'),
                            ),
                          ),

                    const SizedBox(height: 30),
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
                      builder: (context, withdrawProvider, child) {
                        if (withdrawProvider.isLoading) {
                          return const Padding(
                            padding: EdgeInsets.only(top: 200),
                            child: Center(child: Text("No Withdraw History Found")),
                          );
                        }
                        if (withdrawProvider.withdraws.isEmpty) {
                          return const Center(child: Text('Withdraw is empty yet'));
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: withdrawProvider.withdraws.length,
                          itemBuilder: (context, index) {
                            final withdraw = withdrawProvider.withdraws[index];
                            return Column(
                              children: [
                                Container(
                                  child: ListTile(
                                    title: const Text(
                                      'Withdraw',
                                      style: TextStyle(
                                          color: Colors.green, fontWeight: FontWeight.bold, fontFamily: 'Kanit'),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            withdraw.accountTitle,
                                            style: const TextStyle(fontFamily: 'Kanit'),
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            withdraw.accountNo,
                                            style: const TextStyle(fontFamily: 'Kanit'),
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            withdraw.accountType,
                                            style: const TextStyle(fontFamily: 'Kanit'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    leading: const Icon(Icons.download),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Rs. ${withdraw.amount}',
                                          style: const TextStyle(fontSize: 15, fontFamily: 'Kanit'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      icon: const Text(
                                        "Edit",
                                        style: TextStyle(fontSize: 16, color: Colors.blue, fontFamily: 'Kanit'),
                                      ),
                                      onPressed: () {
                                        _showEditWithdrawDialog(context, withdraw, withdrawProvider);
                                      },
                                    ),
                                    IconButton(
                                      icon: const Text(
                                        "Delete",
                                        style: TextStyle(fontSize: 16, color: Colors.red, fontFamily: 'Kanit'),
                                      ),
                                      onPressed: () {
                                        withdrawProvider.deleteWithdraw(withdraw.id.toString());
                                      },
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        withdraw.status,
                                        style: const TextStyle(color: Colors.red, fontFamily: 'Kanit'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    )

                    // Consumer<DepositDetailsProvider>(
                    //   builder: (context, withdrawProvider, child) {
                    //     if (withdrawProvider.isLoading) {
                    //       return const Padding(
                    //           padding: EdgeInsets.only(top: 200),
                    //           child: Center(child: Text("No Withdraw History Found")));
                    //     }
                    //     if (withdrawProvider.withdraws.isEmpty) {
                    //       return const Center(child: Text('Withdraw is empty yet'));
                    //     }
                    //     return ListView.builder(
                    //       shrinkWrap: true,
                    //       physics: const NeverScrollableScrollPhysics(),
                    //       itemCount: withdrawProvider.withdraws.length,
                    //       itemBuilder: (context, index) {
                    //         final withdraw = withdrawProvider.withdraws[index];
                    //         return ListTile(
                    //           title: Text(withdraw.accountTitle),
                    //           subtitle: Text(
                    //             'Amount: ${withdraw.amount}\nStatus: ${withdraw.status}',
                    //           ),
                    //           trailing: Text(withdraw.accountTitle.toString()),
                    //         );
                    //       },
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
