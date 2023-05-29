import 'dart:io';

import 'package:flutter/material.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:simulator_pogruzki/main_screen/presentation/main_screen.dart';
import 'package:simulator_pogruzki/global_variables/global_variables.dart'
    as globals;

class ConnectionScreen extends StatefulWidget {
  ConnectionScreen({Key? key}) : super(key: key);

  @override
  State<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  String _windowSize = 'Unknown';
  var availablePorts = [];

  @override
  void initState() {
    super.initState();
    initPorts();
    print(globals.ports);
  }

  void initPorts() {
    setState(() {
      globals.ports = SerialPort.availablePorts;
    });
  }

  State<ConnectionScreen> createState() => _ConnectionScreenState();

  Future testWindowFunctions() async {
    Size size = await DesktopWindow.getWindowSize();
    await DesktopWindow.setWindowSize(const Size(1440, 1024));
  }

  @override
  Widget build(BuildContext context) {
    testWindowFunctions();
    return Scaffold(
      backgroundColor: const Color(0xFF002863),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(child: SizedBox()),
          Center(
            child: Image.asset(
              'assets/images/gruz.png',
              width: 478,
              height: 314,
            ),
          ),
          const Expanded(child: SizedBox()),
          Text(
            "Выберете порт для подключения",
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 250,
            width: 400,
            child: SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: globals.ports!.length,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        globals.portName = globals.ports![index];
                        if (!SerialPort(globals.portName).openReadWrite()) {
                          print(SerialPort.lastError);
                        }
                        globals.reader = SerialPortReader(SerialPort(globals.portName));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainScreen()),
                        );
                        print(globals.portName);
                      },
                      child: Text(
                        globals.ports![index].toString(),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
          // const Padding(
          //   padding: EdgeInsets.only(right: 30, top: 30),
          //   child: Text(
          //     'ID для входа',
          //     style: TextStyle(color: Colors.white, fontSize: 24),
          //   ),
          // ),
          // Container(
          //   margin: EdgeInsets.only(top: 30, right: 30),
          //   padding: (const EdgeInsets.only(
          //     left: 30,
          //   )),
          //   width: 280,
          //   height: 48,
          //   decoration: BoxDecoration(
          //       color: const Color(0xFF336BD7),
          //       borderRadius: BorderRadius.circular(4)),
          //   child: const TextField(
          //     decoration: InputDecoration(
          //       hintText: " *ID* ",
          //       hintStyle: TextStyle(color: Colors.white),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(right: 30, bottom: 30, top: 30),
          //   child: Container(
          //     width: 240,
          //     height: 50,
          //     child: ElevatedButton(
          //         onPressed: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => const MainScreen()),
          //           );
          //         },
          //         child: const Text(
          //           'Присоедениться',
          //           style: TextStyle(),
          //         )),
          //   ),
          // )
        ],
      ),
    );
  }
}
