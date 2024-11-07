// import 'package:bpro_app_wallet/View/BPro_App_Wallet/bpro_app_wallet_main.dart';
// import 'package:bpro_app_wallet/View/Login_SignUp_Screens/UsingEmail/create_an_account_email.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
//
// class ContinueUsingEmail extends StatefulWidget {
//   const ContinueUsingEmail({super.key});
//
//   @override
//   State<ContinueUsingEmail> createState() => _ContinueUsingEmailState();
// }
//
// class _ContinueUsingEmailState extends State<ContinueUsingEmail> {
//   bool _obscureText = true;
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//
//   void _togglePasswordVisibility() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }
//
//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Center(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Icon(Icons.account_balance_wallet_rounded,
//                     size: 100, color: Colors.green),
//                 const SizedBox(height: 20),
//                 const Text(
//                   'BPro App Wallet',
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                       fontFamily: 'Kanit'),
//                 ),
//                 const SizedBox(height: 10),
//                 TextFormField(
//                   controller: emailController,
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your email';
//                     }
//                     return null;
//                   },
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontFamily: 'Kanit',
//                   ),
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     focusedBorder: OutlineInputBorder(),
//                     labelText: 'Enter Email',
//                     labelStyle: TextStyle(
//                         fontFamily: 'Kanit'),
//                     hintText: 'Email',
//                     hintStyle: TextStyle(
//                       fontFamily: 'Kanit',
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 TextFormField(
//                   controller: passwordController,
//                   obscureText: _obscureText,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your password';
//                     }
//                     return null;
//                   },
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontFamily: 'Kanit',
//                   ),
//                   decoration: InputDecoration(
//                     border: const OutlineInputBorder(),
//                     focusedBorder: const OutlineInputBorder(),
//                     labelText: 'Enter Password',
//                     labelStyle: const TextStyle(
//                         fontFamily: 'Kanit'),
//                     hintText: 'Password',
//                     hintStyle: const TextStyle(
//                       fontFamily: 'Kanit',
//                       fontSize: 20,
//                     ),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _obscureText
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                       ),
//                       onPressed: _togglePasswordVisibility,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Container(
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                       colors: [Color(0xFF175fab), Color.fromARGB(255, 0, 214, 64)],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   width: 250,
//                   height: 40,
//                   child: TextButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const BProWalletMain(),
//                           ),
//                         );
//                       }
//                     },
//                     child: const Text(
//                       'LOGIN',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                           letterSpacing: 3,
//                           height: 1,
//                           fontFamily: 'Kanit'),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 RichText(
//                   text: TextSpan(
//                     children: [
//                       const TextSpan(
//                         text: 'New User? ',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 15,
//                           fontFamily: 'Kanit',
//                         ),
//                       ),
//                       TextSpan(
//                         text: 'Create an Account',
//                         style: const TextStyle(
//                           color: Colors.green,
//                           fontFamily: 'Kanit',
//                           fontSize: 15,
//                         ),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const CreateAnAccountEmailScreen(),
//                               ),
//                             );
//                           },
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:bpro_app_wallet/View/BPro_App_Wallet/bpro_app_wallet_main.dart';
import 'package:bpro_app_wallet/providers/auth_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'create_an_account_email.dart';

class ContinueUsingEmail extends StatefulWidget {
  const ContinueUsingEmail({super.key});

  @override
  State<ContinueUsingEmail> createState() => _ContinueUsingEmailState();
}

class _ContinueUsingEmailState extends State<ContinueUsingEmail> {
  bool _obscureText = true;
  bool _isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthRegister>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.account_balance_wallet_rounded, size: 100, color: Colors.green),
                const SizedBox(height: 20),
                const Text(
                  'BPro App Wallet',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Kanit'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.black, fontFamily: 'Kanit'),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    labelText: 'Enter Email',
                    labelStyle: TextStyle(fontFamily: 'Kanit'),
                    hintText: 'Email',
                    hintStyle: TextStyle(fontFamily: 'Kanit', fontSize: 20),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: passwordController,
                  obscureText: _obscureText,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.black, fontFamily: 'Kanit'),
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(),
                    labelText: 'Enter Password',
                    labelStyle: const TextStyle(fontFamily: 'Kanit'),
                    hintText: 'Password',
                    hintStyle: const TextStyle(fontFamily: 'Kanit', fontSize: 20),
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (_isLoading) const CircularProgressIndicator(),
                if (!_isLoading)
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });
                          try {
                            await authService.loginWithEmailAndPassword(
                              emailController.text,
                              passwordController.text,
                              context,
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
                      },
                      child: const Text(
                        'LOGIN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 3,
                            height: 1,
                            fontFamily: 'Kanit'),
                      ),
                    ),
                  ),
                const SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'New User? ',
                        style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: 'Kanit'),
                      ),
                      TextSpan(
                        text: 'Create an Account',
                        style: const TextStyle(color: Colors.green, fontFamily: 'Kanit', fontSize: 15),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CreateAnAccountEmailScreen(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
