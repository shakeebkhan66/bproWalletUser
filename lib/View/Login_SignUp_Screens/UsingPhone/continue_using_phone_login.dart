import 'package:bpro_app_wallet/View/BPro_App_Wallet/bpro_app_wallet_main.dart';
import 'package:bpro_app_wallet/View/Controller_And_Constants.dart';
import 'package:bpro_app_wallet/View/Login_SignUp_Screens/UsingPhone/create_an_account_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_register.dart';


class ContinueUsingPhone extends StatefulWidget {
  const ContinueUsingPhone({super.key});

  @override
  State<ContinueUsingPhone> createState() => _ContinueUsingPhoneState();
}

class _ContinueUsingPhoneState extends State<ContinueUsingPhone> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> _login(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      try {
        final authProvider = Provider.of<AuthRegister>(context, listen: false);
        await authProvider.loginWithPhoneNumber(phoneController.text, passwordController.text, context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BProWalletMain()),
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.green,
            selectionHandleColor: Colors.green,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.account_balance_wallet_rounded,
                      size: 100, color: Colors.green),
                  const SizedBox(height: 20),
                  const Text(
                    'BPro App Wallet',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Kanit'),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      cursorColor: Colors.green,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Kanit',
                      ),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(),
                        labelText: 'Enter Phone Number',
                        labelStyle: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontFamily: 'Kanit'),
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontFamily: 'Kanit',
                          fontSize: 20,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: _obscureText,
                      keyboardType: TextInputType.visiblePassword,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Kanit',
                      ),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(),
                        labelText: 'Enter Password',
                        labelStyle: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontFamily: 'Kanit'),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 20,
                            fontFamily: 'Kanit'),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: _togglePasswordVisibility,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF175fab), Color.fromARGB(255, 0, 214, 64)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 250,
                    height: 40,
                    child: TextButton(
                      onPressed: _isLoading ? null : () => _login(context),
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                        'LOGIN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 3,
                          height: 1,
                          fontFamily: 'Kanit',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                            text: 'New User? ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Kanit',
                                decoration: TextDecoration.none)),
                        TextSpan(
                            text: 'Create an Account',
                            style: const TextStyle(
                                color: Colors.green,
                                decoration: TextDecoration.none,
                                fontSize: 15,
                                fontFamily: 'Kanit'),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const CreateAnAccountPhoneScreen()),
                                );
                              }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
