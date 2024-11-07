import 'package:bpro_app_wallet/View/BPro_App_Wallet/select_account_to_transfaer.dart';
import 'package:flutter/material.dart';

class Deposit extends StatefulWidget {
  const Deposit({super.key});

  @override
  State<Deposit> createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  late String amount;
  final TextEditingController amountController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  bool isAmountValid() {
    final text = amountController.text;
    if (text.isEmpty) {
      return false;
    }
    final amount = int.tryParse(text);
    return amount != null && amount >= 1000;
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
      body: Theme(
        data: Theme.of(context).copyWith(
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.green, // Change global cursor color here
            selectionHandleColor: Colors.green, // Change handle color here
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Enter Amount you want to deposit in BPro Wallet',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Kanit'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text('Minimum deposit amount is Rs. 1000',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 12,
                            fontFamily: 'Kanit')),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    style: const TextStyle(
                        color: Colors.black, fontFamily: 'Kanit'),
                    keyboardType: TextInputType.number,
                    controller: amountController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: 'Amount',
                      labelText: 'Enter Amount',
                      labelStyle: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontSize: 20,
                          fontFamily: 'Kanit'),
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontSize: 20,
                          fontFamily: 'Kanit'),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                      ),
                      onPressed: isAmountValid()
                          ? () {
                              amount = amountController.text;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SelectAccountToTransfer(
                                    amount: amount,
                                  ),
                                ),
                              );
                            }
                          : null,
                      child: const Text('NEXT',
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
        ),
      ),
    );
  }
}
