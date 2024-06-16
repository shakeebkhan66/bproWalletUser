import 'package:bpro_app_wallet/View/BPro_App_Wallet/bpro_app_wallet_main.dart';
import 'package:bpro_app_wallet/View/Controller_And_Constants.dart';
import 'package:flutter/material.dart';

class AddDetails extends StatefulWidget {
  const AddDetails({super.key});

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Add Details',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Kanit'),
        ),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.green, // Change global cursor color here
            selectionHandleColor: Colors.green, // Change handle color here
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: fullNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(),
                    hintTextDirection: TextDirection.ltr,
                    hintText: 'Full Name',
                    labelText: 'Enter Full Name',
                    labelStyle: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 20,
                        fontFamily: 'Kanit'),
                    hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 20,
                        fontFamily: 'Kanit'),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: whatsappNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    hintTextDirection: TextDirection.ltr,
                    hintText: 'WhatsApp Number',
                    labelText: 'Enter WhatsApp Number',
                    labelStyle: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 20,
                        fontFamily: 'Kanit'),
                    hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 20,
                        fontFamily: 'Kanit'),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.8),
                  borderRadius:
                      BorderRadius.circular(5), // Set border radius here
                ),
                width: double.infinity,
                height: 40,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BProWalletMain()),
                      );
                    },
                    child: const Text(
                      'Finish',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 3,
                          height: 1,
                          fontFamily: 'Kanit'),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
