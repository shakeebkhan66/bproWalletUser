import 'package:bpro_app_wallet/View/BPro_App_Wallet/payment_proof.dart';
import 'package:bpro_app_wallet/View/Controller_And_Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SelectAccountToTransfer extends StatefulWidget {
  final String amount;
  SelectAccountToTransfer({required this.amount});

  @override
  State<SelectAccountToTransfer> createState() =>
      _SelectAccountToTransferState();
}

class _SelectAccountToTransferState extends State<SelectAccountToTransfer> {
  int? _selectedAccount;

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
              const Text('Select Account to Transfer',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Kanit')),
              const SizedBox(
                height: 10,
              ),
              Text(
                  'Transfer funds to the selected account and click the transfer button',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 12,
                      fontFamily: 'Kanit')),
              const SizedBox(
                height: 10,
              ),
              CustomTile(1, 'assets/images/jazzcash.jpg', 'Acc Holder Name',
                  '03121234567', 'JazzCash'),
              const SizedBox(
                height: 10,
              ),
              CustomTile(2, 'assets/images/easypaisa.png', 'Acc Holder Name',
                  '03121234567', 'EasyPaisa'),
              const SizedBox(
                height: 10,
              ),
              CustomTile(3, 'assets/images/hbl.jpg', 'Acc Holder Name',
                  'XXXX-XXXX-XXXX-1234', 'HBL Bank'),
              const SizedBox(
                height: 10,
              ),
              CustomTile(4, 'assets/images/meezan.png', 'Acc Holder Name',
                  'XXXX-XXXX-XXXX-1234', 'Meezan Bank'),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 250,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                  ),
                  onPressed: (_selectedAccount == null)
                      ? null
                      : () {
                          Widget accountTile;
                          if (_selectedAccount == 1) {
                            accountTile = CustomTileReturn(
                                1,
                                'assets/images/jazzcash.jpg',
                                'Acc Holder Name',
                                '03121234567',
                                'JazzCash');
                            accountHolderName = 'Acc Holder Name';
                            accountTypeNumber = 'JazzCash' + ' 03121234567';
                          } else if (_selectedAccount == 2) {
                            accountTile = CustomTileReturn(
                                2,
                                'assets/images/easypaisa.png',
                                'Acc Holder Name',
                                '03121234567',
                                'EasyPaisa');
                            accountHolderName = 'Acc Holder Name';
                            accountTypeNumber = 'EasyPaisa' + ' 03121234567';
                          } else if (_selectedAccount == 3) {
                            accountTile = CustomTileReturn(
                                3,
                                'assets/images/hbl.jpg',
                                'Acc Holder Name',
                                'XXXX-XXXX-XXXX-1234',
                                'HBL Bank');
                            accountHolderName = 'Acc Holder Name';
                            accountTypeNumber =
                                'HBL Bank' + ' XXXX-XXXX-XXXX-1234';
                          } else {
                            accountTile = CustomTileReturn(
                                4,
                                'assets/images/meezan.png',
                                'Acc Holder Name',
                                'XXXX-XXXX-XXXX-1234',
                                'Meezan Bank');
                            accountHolderName = 'Acc Holder Name';
                            accountTypeNumber =
                                'Meezan Bank' + ' XXXX-XXXX-XXXX-1234';
                          }

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentProof(
                                accountTile: accountTile,
                                amount: widget.amount,
                              ),
                            ),
                          );
                        },
                  child: const Text('Transfer',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                          height: 1.5,
                          fontFamily: 'Kanit')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget CustomTile(
      int value, String url, String title, String subtitle, String bankName) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedAccount = value;
          });
        },
        child: ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                bankName,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.8),
                    fontFamily: 'Kanit'),
              ),
              CircleAvatar(
                backgroundImage: AssetImage(url),
                radius: 20,
              ),
            ],
          ),
          title: Text(title,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Kanit')),
          subtitle: Text(subtitle,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black.withOpacity(0.6),
                  fontFamily: 'Kanit')),
          trailing: Radio<int>(
            value: value,
            activeColor: Colors.green,
            groupValue: _selectedAccount,
            onChanged: (int? newValue) {
              setState(() {
                _selectedAccount = newValue;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget CustomTileReturn(
      int value, String url, String title, String subtitle, String bankName) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  bankName,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.8),
                      fontFamily: 'Kanit'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(url),
                  radius: 20,
                ),
              ],
            ),
            title: Text(title,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Kanit')),
            subtitle: Text(subtitle,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.6),
                    fontFamily: 'Kanit')),
            trailing: IconButton(
              icon: const Icon(Icons.copy),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: subtitle));
                Fluttertoast.showToast(
                  msg: 'Account Number Copied to Clipboard',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              },
            )));
  }
}
