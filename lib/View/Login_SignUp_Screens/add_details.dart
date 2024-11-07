import 'package:bpro_app_wallet/View/BPro_App_Wallet/bpro_app_wallet_main.dart';
import 'package:bpro_app_wallet/View/Controller_And_Constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_register.dart';

class AddDetails extends StatefulWidget {
  const AddDetails({super.key});

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {

  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();



  void _register(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final authProvider = Provider.of<AuthRegister>(context, listen: false);
        await authProvider.registerWithPhoneNumber(
          phoneController.text.trim(),
          passwordController.text.trim(),
          fullNameController.text.trim(),
          whatsappNumberController.text.trim(),
          context
        );
      } catch (e) {
        Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black.withOpacity(0.5),
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      Fluttertoast.showToast(
        msg: 'Please fill in all fields',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.5),
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }


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
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.green,
            selectionHandleColor: Colors.green,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
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
                        _register(context);
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
      ),
    );
  }
}
