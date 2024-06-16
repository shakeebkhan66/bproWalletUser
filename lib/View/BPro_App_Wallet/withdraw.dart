import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Withdraw extends StatefulWidget {
  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  int? _radioValue = 0;
  List<Widget> widgets = [];
  bool widgetNotAdded = true;

  void bankNameTextField() {
    if (widgetNotAdded && _radioValue == 3) {
      setState(() {
        widgets.add(const TextField(
          keyboardType: TextInputType.text,
          style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Kanit'),
          decoration: InputDecoration(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Theme(
          data: Theme.of(context).copyWith(
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.green, // Change global cursor color here
              selectionHandleColor: Colors.green, // Change handle color here
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
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
                  const TextField(
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Kanit'),
                    decoration: InputDecoration(
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
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Available Balance',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Kanit'
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Rs. 0',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 12,
                            fontFamily: 'Kanit'
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    child: const Text(
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
                      Container(
                          width: double.infinity,
                          child: const Text('Choose Payment Method',
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _radioValue = 1;
                              bankNameTextField();
                            });
                          },
                          child: ListTile(
                            title: const Text('EasyPaisa',
                            style: TextStyle(
                              fontFamily: 'Kanit'
                            ),
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
                                Image.asset('assets/images/easypaisa.png',
                                    width: 40, height: 40),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _radioValue = 2;
                              bankNameTextField();
                            });
                          },
                          child: ListTile(
                            title: const Text('JazzCash', style: TextStyle(
                              fontFamily: 'Kanit'
                            ),),
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
                                Image.asset('assets/images/jazzcash.jpg',
                                    width: 40, height: 40),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _radioValue = 3;
                              bankNameTextField();
                            });
                          },
                          child: ListTile(
                            title: const Text('Bank', style: TextStyle(
                              fontFamily: 'Kanit'
                            ),),
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
                      const SizedBox(height: 10),
                      Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: widgets.length,
                          itemBuilder: (BuildContext context, int index) {
                            return widgets[index];
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      const TextField(
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Kanit'),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Enter Account Number',
                          hintText: 'Account Number',
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
                      ),
                      const SizedBox(height: 10),
                      const TextField(
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Kanit'),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
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
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {},
                      child: const Text('Transfer',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                      color: Colors.amber.withOpacity(0.4),
                      child: const Text('آپ کو 12 گھنٹے میں ادائیگی کردی جائے گی۔',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Kanit',
                            fontWeight: FontWeight.bold,
                          ))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
