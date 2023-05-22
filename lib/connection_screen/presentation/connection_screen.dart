import 'package:flutter/material.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:simulator_pogruzki/main_screen/presentation/main_screen.dart';

class ConnectionScreen extends StatefulWidget {
  const ConnectionScreen({Key? key}) : super(key: key);

  @override
  State<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  String _windowSize = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future testWindowFunctions() async {
    Size size = await DesktopWindow.getWindowSize();
    print(size);
    await DesktopWindow.setWindowSize(const Size(1440, 1024));
    print(size);
  }

  @override
  Widget build(BuildContext context) {
    testWindowFunctions();
    return Scaffold(
      backgroundColor: const Color(0xFF002863),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Expanded(child: SizedBox()),
          Center(
            child: Image.asset(
              'assets/images/gruz.png',
              width: 678,
              height: 514,
            ),
          ),
          const Expanded(child: SizedBox()),
          const Padding(
            padding: EdgeInsets.only(right: 30, top: 30),
            child: Text(
              'ID для входа',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, right: 30),
            padding: (const EdgeInsets.only(left: 30, )),
            width: 280,
            height: 48,
            decoration: BoxDecoration(
                color: const Color(0xFF336BD7),
                borderRadius: BorderRadius.circular(4)),
            child: const TextField(
              decoration: InputDecoration(
                hintText: " *ID* ",
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, bottom: 30, top: 30),
            child: Container(
              width: 240,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()),
                    );
                  },
                  child: const Text(
                    'Присоедениться',
                    style: TextStyle(),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
