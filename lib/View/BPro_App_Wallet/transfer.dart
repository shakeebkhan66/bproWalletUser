import 'package:flutter/material.dart';

class Transfer extends StatefulWidget {
  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  bool changeTransfer = false;

  @override
  Widget build(BuildContext context) {
    void switchTransfer() {
      changeTransfer = !changeTransfer;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.withOpacity(0.8),
        automaticallyImplyLeading: false,
        title: const Text(
          'Transfer Balance',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Kanit',
          ),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                  text: 'From ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: 'Kanit',
                                      decoration: TextDecoration.none)),
                              TextSpan(
                                text: changeTransfer
                                    ? 'my BPro Account'
                                    : 'this wallet',
                                style: const TextStyle(
                                    color: Colors.green,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Kanit',
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_downward),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                  text: 'To ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: 'Kanit',
                                      decoration: TextDecoration.none)),
                              TextSpan(
                                text: changeTransfer
                                    ? 'this wallet'
                                    : 'my BPro Account',
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontFamily: 'Kanit',
                                    decoration: TextDecoration.none,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          switchTransfer();
                        });
                      },
                      icon: const Icon(Icons.swap_horiz),
                      iconSize: 30,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Kanit'),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter Amount',
                    hintText: '1000',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Kanit',
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Kanit',
                    ),
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
                          fontFamily: 'Kanit',
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
                          fontFamily: 'Kanit',
                        ),
                      ),
                    ),
                  ],
                ),
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
                    onPressed: () {},
                    child: const Text('Transfer',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Kanit',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  width: double.infinity,
                  child: const Text(
                    'Transfer History',
                    style: TextStyle(
                      fontFamily: 'Kanit',
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
