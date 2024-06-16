import 'package:bpro_app_wallet/View/Controller_And_Constants.dart';
import 'package:bpro_app_wallet/View/Login_SignUp_Screens/login_mode.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
          size: 25,
        ),
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Kanit'),
        ),
      ),
      body: SafeArea(
        child: Theme(
          data: Theme.of(context).copyWith(
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.green, // Change global cursor color here
              selectionHandleColor: Colors.green, // Change handle color here
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    child: const Text(
                      'Full Name',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'Kanit'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: fullNameController,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Kanit'),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 3.0,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(),
                        hintTextDirection: TextDirection.ltr,
                        hintText: 'Full Name',
                        labelText: 'Enter Full Name',
                        labelStyle: TextStyle(
                            color: Colors.black.withOpacity(0.4),
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
                    width: double.infinity,
                    child: const Text(
                      'WhatsApp Number',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'Kanit'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: whatsappNumberController,
                      keyboardType: TextInputType.visiblePassword,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Kanit'),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(),
                        hintTextDirection: TextDirection.ltr,
                        hintText: 'WhatsApp Number',
                        labelText: 'Enter WhatsApp Number',
                        labelStyle: TextStyle(
                            color: Colors.black.withOpacity(0.4),
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
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginMode()),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: const Text(
                          'LOGOUT',
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
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Version 1.0.0',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Kanit'
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
