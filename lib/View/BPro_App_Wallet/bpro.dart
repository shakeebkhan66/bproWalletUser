import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BPro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green.withOpacity(0.4),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xffffe5b3), Color(0xff00f2ff)],
                  ),
                ),
                height: 400,
                child: Card(
                  elevation: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xffffe5b3), Color(0xff00f2ff)],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            textSelectionTheme: const TextSelectionThemeData(
                              cursorColor: Colors.green,
                              selectionHandleColor: Colors.green,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                                child: const Center(
                                  child: Text(
                                    'BP',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: 'Kanit',
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextField(
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Kanit'),
                                decoration: InputDecoration(
                                  labelText: 'Enter Username',
                                  hintText: 'Username',

                                  focusedBorder:
                                  const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.green),
                                  ),
                                  labelStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.4),
                                    fontFamily: 'Kanit',
                                  ),
                                  hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.4),
                                    fontFamily: 'Kanit',
                                    fontSize: 20,
                                  ),
                                  prefix: const Icon(Icons.person),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Kanit'),
                                decoration: InputDecoration(
                                  labelText: 'Enter Password',
                                  hintText: 'Password',
                                  focusedBorder:
                                  const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.green),
                                  ),
                                  labelStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.4),
                                    fontFamily: 'Kanit',
                                  ),
                                  hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.4),
                                    fontFamily: 'Kanit',
                                    fontSize: 20,
                                  ),
                                  prefix: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.lock),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                width: 250,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(10),
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.green,
                                  ),
                                  onPressed: () {},
                                  child: const Text('Login',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Kanit',
                                          letterSpacing: 2)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )),
        ));
  }
}
