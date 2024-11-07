// import 'package:bpro_app_wallet/View/Controller_And_Constants.dart';
// import 'package:bpro_app_wallet/View/Login_SignUp_Screens/add_details.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// class CreateAnAccountEmailScreen extends StatefulWidget {
//   const CreateAnAccountEmailScreen({super.key});
//
//   @override
//   State<CreateAnAccountEmailScreen> createState() =>
//       _CreateAnAccountEmailScreenState();
// }
//
// class _CreateAnAccountEmailScreenState
//     extends State<CreateAnAccountEmailScreen> {
//   bool _obscureText = true;
//   void _togglePasswordVisibility() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Theme(
//         data: Theme.of(context).copyWith(
//           textSelectionTheme: const TextSelectionThemeData(
//             cursorColor: Colors.green, // Change global cursor color here
//             selectionHandleColor: Colors.green, // Change handle color here
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Center(
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
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   height: 60,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: TextField(
//                     controller: emailController,
//                     keyboardType: TextInputType.text,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontFamily: 'Kanit',
//                     ),
//                     decoration: InputDecoration(
//                       border: const OutlineInputBorder(),
//                       focusedBorder: const OutlineInputBorder(),
//                       hintTextDirection: TextDirection.ltr,
//                       labelText: 'Enter Email',
//                       labelStyle: TextStyle(
//                           color: Colors.black.withOpacity(0.4),
//                           fontFamily: 'Kanit'),
//                       hintText: 'Email',
//                       hintStyle: TextStyle(
//                         color: Colors.black.withOpacity(0.4),
//                         fontFamily: 'Kanit',
//                         fontSize: 20,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Container(
//                   height: 60,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: TextField(
//                     controller: passwordController,
//                     obscureText: _obscureText,
//                     keyboardType: TextInputType.visiblePassword,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontFamily: 'Kanit',
//                     ),
//                     decoration: InputDecoration(
//                       border: const OutlineInputBorder(),
//                       focusedBorder: const OutlineInputBorder(),
//                       labelText: 'Enter Password',
//                       labelStyle: TextStyle(
//                           color: Colors.black.withOpacity(0.4),
//                           fontFamily: 'Kanit'),
//                       hintTextDirection: TextDirection.ltr,
//                       hintText: 'Password',
//                       hintStyle: TextStyle(
//                         color: Colors.black.withOpacity(0.4),
//                         fontFamily: 'Kanit',
//                         fontSize: 20,
//                       ),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _obscureText
//                               ? Icons.visibility
//                               : Icons.visibility_off,
//                         ),
//                         onPressed: _togglePasswordVisibility,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                       colors: [
//                         Color(0xFF175fab),
//                         Color.fromARGB(255, 0, 214, 64)
//                       ],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     borderRadius:
//                         BorderRadius.circular(10), // Set border radius here
//                   ),
//                   width: 250,
//                   height: 40,
//                   child: TextButton(
//                       onPressed: () {
//                         if (emailController.text.isEmpty ||
//                             passwordController.text.isEmpty) {
//                           Fluttertoast.showToast(
//                             msg: (emailController.text.isEmpty &&
//                                     passwordController.text.isEmpty)
//                                 ? 'Please fill in all fields'
//                                 : (emailController.text.isEmpty)
//                                     ? 'Please enter your email'
//                                     : 'Please enter your password',
//                             toastLength: Toast.LENGTH_SHORT,
//                             gravity: ToastGravity.BOTTOM,
//                             timeInSecForIosWeb: 1,
//                             backgroundColor: Colors.black.withOpacity(0.5),
//                             textColor: Colors.white,
//                             fontSize: 16.0,
//                           );
//                         } else {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const AddDetails()),
//                           );
//                         }
//                       },
//                       child: const Text(
//                         'REGISTER ACCOUNT',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                           letterSpacing: 2,
//                           height: 1,
//                           fontFamily: 'Kanit',
//                         ),
//                       )),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 RichText(
//                   text: TextSpan(
//                     children: [
//                       const TextSpan(
//                           text: 'Already have an account? ',
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 15,
//                               fontFamily: 'Kanit',
//                               decoration: TextDecoration.none)),
//                       TextSpan(
//                           text: 'Login',
//                           style: const TextStyle(
//                             color: Colors.green,
//                             decoration: TextDecoration.none,
//                             fontSize: 15,
//                             fontFamily: 'Kanit',
//                           ),
//                           recognizer: TapGestureRecognizer()
//                             ..onTap = () {
//                               Navigator.pop(context);
//                             }),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:bpro_app_wallet/providers/auth_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'continue_using_email_login.dart';

class CreateAnAccountEmailScreen extends StatefulWidget {
  const CreateAnAccountEmailScreen({super.key});

  @override
  State<CreateAnAccountEmailScreen> createState() => _CreateAnAccountEmailScreenState();
}

class _CreateAnAccountEmailScreenState extends State<CreateAnAccountEmailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthRegister>(context);

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
                  const Icon(Icons.account_balance_wallet_rounded, size: 100, color: Colors.green),
                  const SizedBox(height: 20),
                  const Text(
                    'BPro App Wallet',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Kanit'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    style: const TextStyle(color: Colors.black, fontFamily: 'Kanit'),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(),
                      labelText: 'Enter Name',
                      labelStyle: TextStyle(color: Colors.black.withOpacity(0.4), fontFamily: 'Kanit'),
                      hintText: 'Name',
                      hintStyle: TextStyle(color: Colors.black.withOpacity(0.4), fontFamily: 'Kanit', fontSize: 20),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.black, fontFamily: 'Kanit'),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(),
                      labelText: 'Enter Email',
                      labelStyle: TextStyle(color: Colors.black.withOpacity(0.4), fontFamily: 'Kanit'),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.black.withOpacity(0.4), fontFamily: 'Kanit', fontSize: 20),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: passwordController,
                    obscureText: _obscureText,
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(color: Colors.black, fontFamily: 'Kanit'),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(),
                      labelText: 'Enter Password',
                      labelStyle: TextStyle(color: Colors.black.withOpacity(0.4), fontFamily: 'Kanit'),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.black.withOpacity(0.4), fontFamily: 'Kanit', fontSize: 20),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                        onPressed: _togglePasswordVisibility,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  if (_isLoading) ...[
                    const CircularProgressIndicator(
                      color: Colors.green,
                    ),
                    const SizedBox(height: 20),
                  ] else ...[
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
                          if (_formKey.currentState?.validate() ?? false) {
                            setState(() {
                              _isLoading = true;
                            });
                            try {
                              User? user = await authService.registerWithEmailAndPassword(
                                emailController.text,
                                passwordController.text,
                                nameController.text,
                              );
                              if (user != null) {
                                Navigator.pushReplacement(
                                    context, MaterialPageRoute(builder: (context) => const ContinueUsingEmail()));
                                Fluttertoast.showToast(
                                  msg: 'Verification email sent. Please check your email.',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black.withOpacity(0.5),
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                              }
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
                          'REGISTER ACCOUNT',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2,
                            height: 1,
                            fontFamily: 'Kanit',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Kanit',
                            decoration: TextDecoration.none,
                          ),
                        ),
                        TextSpan(
                          text: 'Login',
                          style: const TextStyle(
                            color: Colors.green,
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            fontFamily: 'Kanit',
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                  context, MaterialPageRoute(builder: (context) => const ContinueUsingEmail()));
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
      ),
    );
  }
}

