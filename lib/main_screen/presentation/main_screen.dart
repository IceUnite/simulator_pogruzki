import 'package:flutter/material.dart';
import 'package:simulator_pogruzki/razgruz_screen/presentation/razgruz_screen.dart';
import 'package:simulator_pogruzki/weight_screen/presentation/weight_screen.dart';
import 'package:simulator_pogruzki/global_variables/global_variables.dart'
    as globals;

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C4D8C),
      body: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 23, bottom: 39, left: 22),
            width: 300,
            height: 962,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xFF002863),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 34,
                ),
                SizedBox(
                    width: 240,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WeightScreen()),
                          );
                        },
                        child: const Text('Измерить вес'))),
                const SizedBox(
                  height: 26,
                ),
                SizedBox(
                  width: 240,
                  height: 50,
                  child: ElevatedButton(
                      style: globals.weight == null
                          ? ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.grey))
                          : null,
                      onPressed: () {
                        if (globals.weight != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RazgruzScreen()),
                          );
                        }
                      },
                      child: const Text('Разгрузить сырье')),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 23,
              bottom: 39,
              left: 34,
              right: 34,
            ),
            width: 1032,
            height: 962,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xFF002863),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Добро пожаловать в систему разгрузки',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/gruz2.png',
                  width: 600,
                  height: 356,
                ),
                SizedBox(
                  height: 108,
                ),
                Text(
                  'Данное приложение позволяет быстро и удобно произвести разгрузку автомобиля различными способами',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  'По работе с программой можно ознакомиться здесь',
                  style: TextStyle(
                      color: Color(
                        0xFF0AA4E9,
                      ),
                      fontSize: 16),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
