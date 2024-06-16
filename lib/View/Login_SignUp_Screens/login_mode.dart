import 'package:bpro_app_wallet/View/Login_SignUp_Screens/UsingEmail/continue_using_email_login.dart';
import 'package:bpro_app_wallet/View/Login_SignUp_Screens/UsingPhone/continue_using_phone_login.dart';
import 'package:flutter/material.dart';

class LoginMode extends StatefulWidget {
  const LoginMode({super.key});
  @override
  State<LoginMode> createState() => _LoginModeState();
}
class _LoginModeState extends State<LoginMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Spacer(),
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
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: <Color>[Color(0xff175fab), Color(0xff3be06d)],
              ), // Set border radius here
            ),
            width: 250,
            height: 50,
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContinueUsingPhone()),
                  );
                },
                child: const Text(
                  'CONTINUE USING PHONE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1,
                      wordSpacing: 0.1,
                      height: 1,
                      fontFamily: 'Kanit'),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Divider(
                  color: Colors.black.withOpacity(0.6),
                  thickness: 2,
                  endIndent: 10, // Space between divider and text
                ),
              ),
              Text(
                'or',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.6),
                    fontFamily: 'Kanit'),
              ),
              Expanded(
                child: Divider(
                  color: Colors.black.withOpacity(0.6),
                  thickness: 2,
                  indent: 10, // Space between divider and text
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[Color(0xff175fab), Color(0xff3be06d)],
              ),
              borderRadius: BorderRadius.circular(15), // Set border radius here
            ),
            width: 250,
            height: 50,
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContinueUsingEmail()),
                  );
                },
                child: const Text(
                  'CONTINUE USING EMAIL',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1,
                      wordSpacing: 0.1,
                      height: 1,
                      fontFamily: 'Kanit'),
                )),
          ),
          const Spacer(),
          const Text(
            'Version 1.0',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontFamily: 'Kanit'),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
              'If you continue you are accepting BPro App Wallet Terms and Conditions and Privacy Policy',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  letterSpacing: 0.1,
                  wordSpacing: 0.1,
                  height: 1,
                  fontFamily: 'Kanit')),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    )));
  }
}
